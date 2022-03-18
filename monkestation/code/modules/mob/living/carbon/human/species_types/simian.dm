/datum/species/simian
	// Highly intelligent, genetically modified chimps
	name = "Simian"
	id = SPECIES_SIMIAN
	bodyflag = FLAG_SIMIAN
	say_mod = "chimpers"
	species_traits = list(SKINTONES,EYECOLOR,LIPS,ALTEYESPRITES,NO_UNDERWEAR)
	alt_eye = 'monkestation/icons/mob/species/simian/bodyparts.dmi'
	inherent_biotypes = list(MOB_ORGANIC, MOB_HUMANOID)
	mutant_bodyparts = list("tail_monkey")
	mutanttail = /obj/item/organ/tail/monkey
	default_features = list("tail_monkey" = "Chimp")
	skin_tone_list = "simian"
	changesource_flags = MIRROR_BADMIN | MIRROR_PRIDE | MIRROR_MAGIC | RACE_SWAP | ERT_SPAWN
	meat = /obj/item/reagent_containers/food/snacks/meat/slab/monkey
	skinned_type = /obj/item/stack/sheet/animalhide/monkey
	disliked_food = GROSS
	liked_food = FRUIT | MEAT
	deathsound = 'sound/voice/lizard/deathsound.ogg' //todo change
	species_language_holder = /datum/language_holder/monkey

	species_chest = /obj/item/bodypart/chest/simian
	species_head = /obj/item/bodypart/head/simian
	species_l_arm = /obj/item/bodypart/l_arm/simian
	species_r_arm = /obj/item/bodypart/r_arm/simian
	species_l_leg = /obj/item/bodypart/l_leg/simian
	species_r_leg = /obj/item/bodypart/r_leg/simian

/datum/species/simian/random_name(gender,unique,lastname)
	if(unique)
		return random_unique_simian_name(gender)

	var/randname = simian_name(gender)

	if(lastname)
		randname += " [lastname]"

	return randname


//for sprite sheets; hats, eyes, and masks are "good enough" so for now we're just using pixel offset on those.
/datum/species/simian/get_custom_icons(var/part)
	switch(part)
		if("uniform")
			return 'monkestation/icons/mob/species/simian/simian_uniforms.dmi'
		if("gloves")
			return 'monkestation/icons/mob/species/simian/simian_gloves.dmi'
		if("glasses")
			return null
		if("ears")
			return null
		if("shoes")
			return 'monkestation/icons/mob/species/simian/simian_shoes.dmi'
		if("head")
			return null
		if("belt")
			return 'monkestation/icons/mob/species/simian/simian_belts.dmi'
		if("suit")
			return 'monkestation/icons/mob/species/simian/simian_suits.dmi'
		if("back")
			return 'monkestation/icons/mob/species/simian/simian_back.dmi'
		if("neck")
			return null
		if("generic")
			return null
		//	return 'monkestation/icons/mob/species/simian/simian_neck.dmi' finish
		else
			return
