/datum/quirk/kleptomaniac/on_spawn()


/datum/status_effect/kleptomania
	id = "spasms"
	status_type = STATUS_EFFECT_KLEPTOMANIA
	alert_type = null

/datum/status_effect/kleptomania/tick()
	var/mob/living/carbon/human/H
	if(H.stat && !(H.incapacitated()) && prob(10)) //for testing
		if(!H.get_active_held_item())
			var/obj/item/I
			if(prob(20))
				for(var/mob/living/carbon/human/victim in view(1, H))
					var/pockets = victim.get_pockets()
					I = pick(pockets)
					if(victim.temporarilyRemoveItemFromInventory(I))
						if(!QDELETED(I) && !H.put_in_active_hand(I, TRUE, TRUE))
							I.forceMove(H.drop_location())
							break
			else
				for(I in view(1, H))
					if(!I.anchored) //anything that's not nailed down
						I.attack_hand(H)
					break
