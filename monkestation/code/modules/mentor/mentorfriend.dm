/datum/admins/proc/imaginary_friend()
	set category = "Mentor"
	set name = "Become Imaginary Friend"

	if(!usr.client.is_mentor())
		return

	if(istype(usr, /mob/camera/imaginary_friend/mentor))
		var/mob/camera/imaginary_friend/mentor/mentor = usr
		mentor.unmentor()
		return

	if(usr.client.is_mentor() && !isobserver(usr))
		to_chat(usr, "<span class='warning'>Can only become an imaginary friend while observing.</span>")
		return

	if(!isobserver(usr))
		usr.client.admin_ghost()

	var/mob/living/mentee
	switch(input("Select by:", "Imaginary Friend") as null|anything in list("Key", "Mob"))
		if("Key")
			var/client/C = input("Please, select a key.", "Imaginary Friend") as null|anything in sortKey(GLOB.clients)
			if(!C)
				return
			mentee = C.mob
		if("Mob")
			var/mob/M = input("Please, select a mob.", "Imaginary Friend") as null|anything in sortNames(GLOB.mob_living_list)
			if(!M)
				return
			mentee = M

	if(!isobserver(usr))
		return

	if(!istype(mentee))
		to_chat("<span class='warning'>Selected mob is not alive.</span>")
		return

	var/mob/camera/imaginary_friend/mentor/mentor = new(get_turf(mentee), mentee)
	usr.mind.transfer_to(mentor)

	log_admin("[key_name(mentor)] started being imaginary friend of [key_name(mentee)].")
	message_admins("[key_name(mentor)] started being imaginary friend of [key_name(mentee)].")
