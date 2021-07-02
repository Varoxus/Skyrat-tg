/mob/living/Login()
	. = ..()
	if(ckey)
		if(is_banned_from(ckey, BAN_PACIFICATION))
			ADD_TRAIT(src, TRAIT_PACIFISM, ROUNDSTART_TRAIT)

/mob/dead/observer/Login()
	. = ..()
	if(ckey)
		if(is_banned_from(ckey, BAN_DONOTREVIVE))
			to_chat(src, "<span class='notice'>As you are revival banned, you cannot reenter your body.")
			can_reenter_corpse = FALSE

/datum/controller/subsystem/ticker/proc/process_eorg_bans()
	for(var/mob/iterating_player in GLOB.mob_list)
		if(iterating_player.ckey && is_banned_from(iterating_player.ckey, BAN_EORG))
			new /obj/effect/particle_effect/sparks/quantum (iterating_player.loc)
			qdel(iterating_player)
