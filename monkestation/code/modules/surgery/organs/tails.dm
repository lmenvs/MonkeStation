/obj/item/organ/tail/fox
	name = "fox tail"
	desc = "If you collect seven, you are considered lucky!"
	tail_type = "Fox"
	mutant_bodypart_name = list("tail_fox")
	wagging_mutant_name = list("waggingtail_fox")

/obj/item/organ/tail/Insert(mob/living/carbon/human/H, special = 0, drop_if_replaced = TRUE)
	..()
	if(istype(H))
		if(!(mutant_bodypart_name in H.dna.species.mutant_bodyparts))
			H.dna.species.mutant_bodyparts |= mutant_bodypart_name
			H.dna.features["tail_fox"] = tail_type
			H.update_body()

/obj/item/organ/tail/Remove(mob/living/carbon/human/H,  special = 0)
	..()
	if(istype(H))
		H.dna.features["tail_fox"] = "None"
		if(wagging)
			H.dna.species.mutant_bodyparts -= wagging_mutant_name
			wagging = FALSE
		else
			H.dna.species.mutant_bodyparts -= mutant_bodypart_name
		H.update_body()
