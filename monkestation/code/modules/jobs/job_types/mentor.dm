/datum/job/assistant/mentor



/datum/outfit/job/assistant/mentor
	name = "mentor"
	jobtype = /datum/job/assistant
	belt = /obj/item/pda/assistant

/datum/outfit/job/assistant/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.jumpsuit_style == PREF_SUIT)
		uniform = /obj/item/clothing/under/color/lightpurple
	else
		uniform = /obj/item/clothing/under/color/jumpskirt/lightpurple
