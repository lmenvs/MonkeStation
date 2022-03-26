
/datum/status_effect/kleptomania
	id = "kleptomania"
	status_type = STATUS_EFFECT_UNIQUE
	alert_type = null

/datum/status_effect/kleptomania/tick()
	if(!(owner.incapacitated()) && prob(10))
		if(!owner.get_active_held_item())
			if(prob(10))
				for(var/mob/living/carbon/human/victim in view(1, owner))
					if(victim != owner) //WHICH ONE OF YOU FLATFOOTS ATE MY CHOCOLATE BAR
						var/pockets = victim.get_pockets()
						var/obj/item/I = pick(pockets)
						owner.visible_message("<span class='warning'>[owner] attempts to remove [I] from [victim]'s pocket!</span>","<span class='warning'>You attempt to remove [I] from [victim]'s pocket.</span>", FALSE, 1)
						if(do_after(owner, I.strip_delay, null, owner))
							if(victim.temporarilyRemoveItemFromInventory(I))
								owner.visible_message("<span class='warning'>[owner] removes [I] from [victim]'s pocket!</span>","<span class='warning'>You remove [I] from [victim]'s pocket.</span>", FALSE, 1)
								if(!QDELETED(I) && !owner.put_in_active_hand(I, TRUE, TRUE))
									I.forceMove(owner.drop_location())

						else
							owner.visible_message("<span class='warning'>[owner] fails to pickpocket [victim].</span>","<span class='warning'>You fail to pick [victim]'s pocket.</span>", FALSE, 1)
						break
			else
				var/mob/living/carbon/C = owner
				for(var/obj/item/I in view(1, C))
					if(!I.anchored && !(I in C.get_all_gear())) //anything that's not nailed down or worn
						I.attack_hand(C)
					break
