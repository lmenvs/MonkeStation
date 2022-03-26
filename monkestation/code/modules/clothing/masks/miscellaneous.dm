/obj/item/clothing/mask/ookmask
	name = "Paper Monkey Mask"
	desc = "One shudders to imagine the inhuman thoughts that lie underneath that mask."
	icon = 'monkestation/icons/obj/clothing/masks.dmi'
	worn_icon = 'monkestation/icons/mob/mask.dmi'
	icon_state = "ook"
	item_state = "ook"
	flags_inv = HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
	alternative_screams = list(	'sound/creatures/monkey/monkey_screech_1.ogg',
								'sound/creatures/monkey/monkey_screech_2.ogg',
								'sound/creatures/monkey/monkey_screech_3.ogg',
								'sound/creatures/monkey/monkey_screech_4.ogg',
								'sound/creatures/monkey/monkey_screech_5.ogg',
								'sound/creatures/monkey/monkey_screech_6.ogg',
								'sound/creatures/monkey/monkey_screech_7.ogg')

	alternative_laughs = list(	'monkestation/sound/voice/laugh/misc/big_laugh0.ogg',
								'monkestation/sound/voice/laugh/misc/big_laugh1.ogg',
								'monkestation/sound/voice/laugh/misc/big_laugh2.ogg',
								'monkestation/sound/voice/laugh/misc/big_laugh3.ogg',
								'monkestation/sound/voice/laugh/misc/big_laugh4.ogg')

/obj/item/clothing/mask/translator
	name = "MonkeTech AutoTranslator"
	desc = "This little gadget helps simians automatically translate speech to common."
	icon = 'monkestation/icons/obj/clothing/masks.dmi'
	worn_icon = 'monkestation/icons/mob/mask.dmi'
	icon_state = "translator"
	item_state = "translator"
	slot_flags = ITEM_SLOT_MASK | ITEM_SLOT_NECK

/obj/item/clothing/mask/translator/equipped(mob/M, slot)
	. = ..()
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		H.grant_language(/datum/language/common, understood = TRUE, spoken = TRUE, source = LANGUAGE_HAT)

/obj/item/clothing/mask/translator/dropped(mob/M)
	. = ..()
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		H.remove_language(/datum/language/common, understood = FALSE, spoken = TRUE, source = LANGUAGE_HAT)







