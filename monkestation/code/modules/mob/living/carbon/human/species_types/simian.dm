/datum/species/simian
	// Highly intelligent, genetically modified chimps
	name = "Simian"
	id = SPECIES_SIMIAN
	bodyflag = FLAG_SIMIAN
	say_mod = "chimpers"
	default_color = "00FF00"
	species_traits = list(MUTCOLORS,EYECOLOR, LIPS)
	inherent_biotypes = list(MOB_ORGANIC, MOB_HUMANOID)
	mutant_bodyparts = list("tail_simian")
	mutanttail = /obj/item/organ/tail/simian
	default_features = list("mcolor" = "0F0")
	changesource_flags = MIRROR_BADMIN | MIRROR_PRIDE | MIRROR_MAGIC | RACE_SWAP | ERT_SPAWN
	meat = /obj/item/reagent_containers/food/snacks/meat/slab/monkey
	skinned_type = /obj/item/stack/sheet/animalhide/monkey
	disliked_food = GROSS
	liked_food = FRUIT | MEAT
	deathsound = 'sound/voice/lizard/deathsound.ogg' //todo change
	species_language_holder = /datum/language_holder/simian //todo update

/datum/species/simian/random_name(gender,unique,lastname)
	if(unique)
		return random_unique_simian_name(gender)

	var/randname = simian_name(gender)

	if(lastname)
		randname += " [lastname]"

	return randname

/datum/species/ethereal/on_species_gain(mob/living/carbon/C, datum/species/old_species, pref_load)
	. = ..()
	if(!ishuman(C))
		return
	var/mob/living/carbon/human/simian = C
	default_color = "#[ethereal.dna.features["ethcolor"]]"
	default_color = "#[ethereal.dna.features["ethcolor"]]"


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
