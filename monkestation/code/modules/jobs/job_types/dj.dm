/datum/job/pirate_radio //DJ is too short for the define
	title = "DJ"
	flag = DJ_RADIO
	department_head = list("Head of Personnel")
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the head of personnel"
	selection_color = "#b0d686"
	chat_color = "#aa8ec9"
	exp_type_department = EXP_TYPE_SERVICE

	outfit = /datum/outfit/job/pirate_radio

	access = list(ACCESS_MAINT_TUNNELS, ACCESS_DJ_EQUIPMENT)
	minimal_access = list(ACCESS_DJ_EQUIPMENT)
	paycheck = PAYCHECK_EASY
	paycheck_department = ACCOUNT_SRV
	display_order = JOB_DISPLAY_ORDER_DJ
	departments = DEPARTMENT_SERVICE

	species_outfits = list(
		SPECIES_PLASMAMAN = /datum/outfit/plasmaman
	)
/datum/outfit/job/pirate_radio
	name = "DJ"
	jobtype = /datum/job/pirate_radio

	id = /obj/item/card/id/job/serv
	glasses = /obj/item/clothing/glasses/sunglasses/advanced/reagent
	belt = /obj/item/pda/bar
	ears = /obj/item/radio/headset/headset_srv
	uniform = /obj/item/clothing/under/rank/civilian/bartender
	suit = /obj/item/clothing/suit/armor/vest
	backpack_contents = list(/obj/item/storage/box/beanbag=1)
	shoes = /obj/item/clothing/shoes/laceup
