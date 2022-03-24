/datum/brain_trauma/mild/kleptomania
	name = "Kleptomania"
	desc = "Patient has a fixation of small objects and may involuntarily pick them up."
	scan_desc = "nervous fits"
	gain_text = "<span class='warning'>Your muscles feel oddly faint.</span>"
	lose_text = "<span class='notice'>You feel in control of your muscles again.</span>"

/datum/brain_trauma/mild/muscle_spasms/on_gain()
	owner.apply_status_effect(STATUS_EFFECT_KLEPTOMANIA)
	..()

/datum/brain_trauma/mild/muscle_spasms/on_lose()
	owner.remove_status_effect(STATUS_EFFECT_KLEPTOMANIA)
	..()

