/datum/round_event_control/florida_man
	name = "Florida Man"
	typepath = /datum/round_event/ghost_role/florida_man
	weight = 5
	max_occurrences = 3

/datum/round_event/ghost_role/florida_man
	minimum_required = 1
	role_name = "Florida Man"
	fakeable = FALSE

/datum/round_event/ghost_role/florida_man/proc/equip_floridan(mob/living/carbon/human/H)
	var/i = round(rand(4))
	switch(i)
		if(1)
			return H.equipOutfit(/datum/outfit/florida_man_one)
		if(2)
			return H.equipOutfit(/datum/outfit/florida_man_two)
		if(3)
			return H.equipOutfit(/datum/outfit/florida_man_three)
		if(4)
			return H.equipOutfit(/datum/outfit/florida_man_four)

/datum/round_event/ghost_role/florida_man/spawn_role()
	var/list/candidates = get_candidates()
	var/turf/spawn_loc = find_safe_turf()//Used for the Drop Pod type of spawn

	if(!candidates.len)
		return NOT_ENOUGH_PLAYERS

	var/mob/dead/selected = pick_n_take(candidates)
	var/mob/living/carbon/human/floridan = new()
	var/datum/preferences/A = new

	if(floridan.gender == FEMALE)
		floridan.name = "Florida Woman"
		floridan.real_name = "Florida Woman"
	else
		floridan.name = "Florida Man"
		floridan.real_name = "Florida Man"

	equip_floridan(floridan)

	ADD_TRAIT(floridan, TRAIT_MONKEYLIKE, "Florida Man")
	ADD_TRAIT(floridan, TRAIT_STUNIMMUNE, "Florida Man")
	ADD_TRAIT(floridan, TRAIT_STABLELIVER, "Florida Man")
	ADD_TRAIT(floridan, TRAIT_STABLEHEART, "Florida Man")
	ADD_TRAIT(floridan, TRAIT_TOXIMMUNE, "Florida Man")
	ADD_TRAIT(floridan, TRAIT_JAILBIRD, "Florida Man")
	ADD_TRAIT(floridan, TRAIT_IGNORESLOWDOWN, "Florida Man")

	var/obj/effect/proc_holder/spell/targeted/doorbuster/DB = new
	floridan.AddSpell(DB)

	A.copy_to(floridan)
	floridan.dna.update_dna_identity()
	var/datum/mind/Mind = new /datum/mind(selected.key)
	Mind.assigned_role = "Florida Man"
	Mind.special_role = "Florida Man"
	Mind.active = 1
	Mind.transfer_to(floridan)
	Mind.add_antag_datum(/datum/antagonist/florida_man)


	var/i = round(rand(4))
	switch(i)
		if(1)
			var/obj/structure/closet/supplypod/bluespacepod/pod = new()
			pod.explosionSize = list(0,0,0,0)
			pod.stay_after_drop = TRUE
			new /obj/effect/pod_landingzone(spawn_loc, pod)
			floridan.forceMove(pod)
			//Drop Pod Car
		if(2)
			var/obj/structure/closet/supplypod/bluespacepod/pod = new()
			pod.explosionSize = list(0,0,0,0)
			pod.stay_after_drop = TRUE
			new /obj/effect/pod_landingzone(spawn_loc, pod)
			floridan.forceMove(pod)
			//Drop Pod Washing Machine
		if(3)
			floridan.forceMove(get_unlocked_closed_locker()) //I KNEW THIS PROC WOULD HAVE MORE USES!
			//Locker/crate spawn
		if(4)
			floridan.forceMove(spawn_loc)
			floridan.Paralyze(10, TRUE, TRUE)
			new /obj/effect/holy(spawn_loc)
			//God has thrown you out of heaven, you know what you did. Don't try to deny your sins against humanity, Florida Man.

	message_admins("[ADMIN_LOOKUPFLW(floridan)] has been made into Florida Man.")
	log_game("[key_name(floridan)] was spawned as Florida Man by an event.")
	spawned_mobs += floridan
	return SUCCESSFUL_SPAWN
