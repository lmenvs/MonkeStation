/datum/round_event_control/florida_man
	name = "Florida Man"
	typepath = /datum/round_event/ghost_role/florida_man
	weight = 5
	max_occurrences = 1

/datum/round_event/ghost_role/florida_man
	minimum_required = 1
	role_name = "Florida Man"
	fakeable = FALSE

/datum/round_event/ghost_role/florida_man/spawn_role()
	var/list/candidates = get_candidates()
	var/turf/spawn_loc //Used for the Drop Pod type of spawn

	if(!candidates.len)
		return NOT_ENOUGH_PLAYERS

	var/mob/dead/selected = pick_n_take(candidates)
	var/mob/living/carbon/human/floridan = new()
	var/datum/preferences/A = new

	if(floridan.gender = FEMALE)
		floridan.name = "Florida Woman"
	else
		floridan.name = "Florida Man"

	A.copy_to(floridan)
	floridan.dna.update_dna_identity()
	var/datum/mind/Mind = new /datum/mind(selected.key)
	Mind.assigned_role = "Florida Man"
	Mind.special_role = "Florida Man"
	Mind.active = 1
	Mind.transfer_to(floridan)
	Mind.add_antag_datum(/datum/antagonist/florida_man)


	var/i = round(rand(3))
	switch(i)
		if(1)
			floridan.forceMove(get_unlocked_closed_locker())
			//Drop Pod Car
		if(2)
			floridan.forceMove(get_unlocked_closed_locker())
			//Drop Pod Washing Machine
		if(3)
			floridan.forceMove(get_unlocked_closed_locker()) //I KNEW THIS PROC WOULD HAVE MORE USES!

	message_admins("[ADMIN_LOOKUPFLW(floridan)] has been made into lone operative by an event.")
	log_game("[key_name(floridan)] was spawned as a lone operative by an event.")
	spawned_mobs += floridan
	return SUCCESSFUL_SPAWN
