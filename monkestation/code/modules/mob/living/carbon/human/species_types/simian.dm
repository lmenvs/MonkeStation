/datum/species/simian
	// Highly intelligent, genetically modified chimps
	name = "Simian"
	id = SPECIES_SIMIAN
	bodyflag = FLAG_SIMIAN
	say_mod = "chimpers"
	default_color = "00FF00"
	species_traits = list(MUTCOLORS,EYECOLOR, LIPS)
	inherent_biotypes = list(MOB_ORGANIC, MOB_HUMANOID)
	mutant_bodyparts = list("tail_monkey")
	mutanttail = /obj/item/organ/tail/monkey
	default_features = list("mcolor" = "0F0")
	changesource_flags = MIRROR_BADMIN | MIRROR_PRIDE | MIRROR_MAGIC | RACE_SWAP | ERT_SPAWN
	meat = /obj/item/reagent_containers/food/snacks/meat/slab/monkey
	skinned_type = /obj/item/stack/sheet/animalhide/monkey
	disliked_food = GROSS
	liked_food = FRUIT | MEAT
	deathsound = 'sound/voice/lizard/deathsound.ogg' //todo change
	species_language_holder = /datum/language_holder/monkey//todo update

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
			return 'monkestation/icons/mob/species/simian/simian_uniforms.dmi' //done
		if("gloves")
			return 'monkestation/icons/mob/species/simian/simian_gloves.dmi' //done
		if("ears")
			return 'monkestation/icons/mob/species/simian/simian_ears.dmi'
		if("shoes")
			return 'monkestation/icons/mob/species/simian/simian_shoes.dmi' //done
		if("belt")
			return 'monkestation/icons/mob/species/simian/simian_belts.dmi' //done
		if("suit")
			return 'monkestation/icons/mob/species/simian/simian_suits.dmi' //done
		if("back")
			return 'monkestation/icons/mob/species/simian/simian_back.dmi' //done
		if("neck")
			return 'monkestation/icons/mob/species/simian/simian_neck.dmi'
		else
			return
