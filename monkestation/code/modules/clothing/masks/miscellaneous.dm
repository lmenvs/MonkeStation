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
	desc = "A small device that will translate speech."
	icon = 'monkestation/icons/obj/clothing/masks.dmi'
	worn_icon = 'monkestation/icons/mob/mask.dmi'
	icon_state = "translator"
	item_state = "translator"
	slot_flags = ITEM_SLOT_MASK | ITEM_SLOT_NECK
	modifies_speech = TRUE
	var/currentlanguage = /datum/language/common
	var/list/available_languages = list(/datum/language/common) //basic translator has only common


/obj/item/clothing/mask/translator/proc/update_languages(mob/living/carbon/human/user)
	for(var/language in GLOB.all_languages) //check all languages
		if(user.has_language(language, FALSE)) //if the user understands a language, their translator learns this language
			src.available_languages.Add(language)
		if(!(user.has_language(language, FALSE)) && (language in available_languages))
			src.available_languages.Remove(language)//if we don't understand a language, we remove!


/obj/item/clothing/mask/translator/attack_self(mob/user)
	. = ..()
	if(ishuman(user))
		update_languages(user)
	if(length(available_languages) > 1)
		currentlanguage = input("Select a new language:", "Selected language", currentlanguage) in available_languages
	else
		to_chat(user, "<span class='notice'>There are no other languages to choose from!</span>")


/obj/item/clothing/mask/translator/equipped(mob/M, slot)
	. = ..()
	if ((slot == ITEM_SLOT_MASK || slot == ITEM_SLOT_NECK) && modifies_speech)
		RegisterSignal(M, COMSIG_MOB_SAY, .proc/handle_speech)
	else
		UnregisterSignal(M, COMSIG_MOB_SAY)

/obj/item/clothing/mask/translator/handle_speech(datum/source, list/speech_args)
	. = ..()
	if(!CHECK_BITFIELD(clothing_flags, VOICEBOX_DISABLED))
		if(obj_flags & EMAGGED)
			speech_args[SPEECH_LANGUAGE] = pick(GLOB.all_languages)
		else
			speech_args[SPEECH_LANGUAGE] = currentlanguage

/obj/item/clothing/mask/translator/examine(mob/user)
	. = ..()
	. += "<span class='notice'>Click while in hand to select output language.</span>"

/obj/item/clothing/mask/translator/emag_act()
	if(obj_flags & EMAGGED)
		return
	obj_flags |= EMAGGED
	icon_state = "translator_emag"
	playsound(src, "sparks", 100, 1)

/obj/item/clothing/mask/translator/foreigner
	currentlanguage = /datum/language/uncommon
	available_languages = list(/datum/language/uncommon)


