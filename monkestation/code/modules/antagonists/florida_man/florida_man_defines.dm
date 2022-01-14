GLOBAL_LIST_INIT(florida_man_base_objectives,list(
	list("Wrassle all the", "you can"),
	list("Smuggle some", "onto the station"),
	list("Get revenge on the", "who did you wrong"),
	list("It's time to start your", "empire back up"),
	list("Get yourself into a fight with all the", "you can"),
	list("The cops are after your", ", don't let them get it"),
	list("You need to confess your feelings to the", "and go on a romantic date with them"),
	list("The hurricanes destroyed everything again.", "would be a great theme for rebuilding"),
	list("Your belly is rumbling, only", "can fill your hunger."),
	list("The MAN is oppressing you with clothes. Unlock the secrets of", "with the power of nudity."),
	list("You've planned for this all night. Steal all the", "you can in the great heist"),
	list("You've lost it all and Mr.Nanotrasen is to blame! Take his", "as recompense"),
	list("Now's your chance to be a big shot! Sell", "to make a few bucks")

))

GLOBAL_LIST_INIT(florida_man_objective_nouns, list(
	"Lizards",
	"Dogs",
	"Meth",
	"Bath Salts",
	"Spice",
	"Hoverboards",
	"Weed",
	"Money",
	"Clothing",
	"Milk",
	"Cat Ears",
	"Robots",
	"Chemicals",
	"Baguettes",
	"Baked Potatoes",
	"Bread",
	"Burgers",
	"Cake",
	"Carp",
	"Cookies",
	"Donk Pockets",
	"Donuts",
	"Fries",
	"Lotsa Spaghetti",
	"Omelettes",
	"Pasta",
	"Pie",
	"Pizza",
	"Popcorn",
	"Sandwiches",
	"Sausages",
	"Soup",
	"Spaghetti",
	"Steak",
	"Stew",
	"Toast",
	"Waffles",
	"Jelly",
	"Eggs",
	"Muffins",
	"Fish",
	"Pretzels",
	"Salad",
	"Cheese",
	"Ketchup",
	"Shakes",
	"Salt",
	"Pepper",
	"Sugar",
	"Ambrosia",
	"Berries",
	"Tomatoes",
	"Cabbages",
	"Carrots",
	"Bananas",
	"Apples",
	"Cherries",
	"Chili",
	"Corn",
	"Nettles",
	"Eggplants",
	"Grapes",
	"Grass",
	"Lemons",
	"Limes",
	"Harebells",
	"Potatoes",
	"Soybeans",
	"Sugarcane",
	"Watermelons",
	"Wheat",
	"Beets",
	"Mushrooms",
	"Deep Fried Food",
	"Corgi Meat",
	"Soylent Green",
	"Kebab",
	"Ramen",
	"Synthmeat",
	"Organs",
	"Crewmembers",
	"Captains",
	"Heads of Personnel",
	"Heads of Security",
	"Security Officers",
	"Wardens",
	"Detectives",
	"Lawyers",
	"Chief Engineers",
	"Station Engineers",
	"Atmospheric Technicians",
	"Janitors",
	"Quartermasters",
	"Cargo Technicians",
	"Shaft Miners",
	"Botanists",
	"Research Directors",
	"Chief Medical Officers",
	"Medical Doctors",
	"Chemists",
	"Geneticists",
	"Virologists",
	"Roboticists",
	"Scientists",
	"Assistants",
	"Bartenders",
	"Chefs",
	"Clowns",
	"Mimes",
	"Chaplains",
	"Curators",
	"Heads of Crew",
	"Captains and Heads",
	"Cyborgs",
	"Artificial Intelligences",
	"Drones",
	"Morphine",
	"Meth",
	"Happiness",
	"Krokodil",
	"Cryptobiolin",
	"Carthatoline",
	"Ethanol",
	"Space Drugs",
	"Water",
	"Iron",
	"Saline-Glucose",
	"Nutriment",
	"Tricordrizine",
	"Radio Headsets",
	"Shoes",
	"Guns",
	"Toolboxes",
	"Toolbelts",
	"Lockers",
	"Beakers",
	"Potted Plants",
	"Tables",
	"Food",
	"First Aid Kits",
	"Monkeys"

))

GLOBAL_LIST_INIT(florida_man_objective_suffix, list(
	"because you can.",
	"just like pap would want you to do.",
	"because screw you! Who are they to decide what I do!",
	"to restore honor to the family name.",
	"just cause.",
	"because...I dunno."
))

/obj/effect/proc_holder/spell/targeted/doorbuster
	var/magic_check = FALSE
	var/holy_check = FALSE
	name = "Doorbuster"
	desc = "Use the power of DRUGS to let you push your way through doors for a short time."
	charge_counter = 0
	charge_max = 20 SECONDS
	clothes_req = FALSE
	range = -1
	include_user = TRUE
	charge_type = "recharge"
	//FLORIDA PLACEHOLDER NEEDS ICONS

/obj/effect/proc_holder/spell/targeted/doorbuster/cast(list/targets, mob/user)
	. = ..()
	if(!ishuman(user))
		return
	var/mob/living/carbon/human/floridan = user
	playsound(floridan, 'sound/arcade/win.ogg', 50)//FLORIDA PLACEHOLDER
	floridan.visible_message("<span class='warning'>[floridan] howls in rage as he begins to charge!</span>", "<span class='notice'>You feel the strength of Florida wash over you, push through those doors!</span>")
	floridan.move_force = MOVE_FORCE_OVERPOWERING
	addtimer(CALLBACK(src, .proc/end_doorbuster),5 SECONDS)

/obj/effect/proc_holder/spell/targeted/doorbuster/proc/end_doorbuster()
	if(!ishuman(usr))
		return
	var/mob/living/carbon/human/floridan = usr
	floridan.move_force = MOVE_FORCE_NORMAL
	floridan.visible_message("<span class='warning'>[floridan] seems to be calmer.</span>", "<span class='warning'>You feel weaker as the strength of Florida leaves you.</span>")

/datum/outfit/florida_man_one
	name = "Florida Man Casual"
	uniform = /obj/item/clothing/under/pants/jeans
	shoes = /obj/item/clothing/shoes/sandal
	ears = /obj/item/radio/headset
	back = /obj/item/storage/backpack
	//Shoes, jeans, backpack

/datum/outfit/florida_man_two
	name = "Florida Man Formal"
	uniform = /obj/item/clothing/under/suit/green
	neck = /obj/item/clothing/neck/tie/horrible
	ears = /obj/item/radio/headset
	back = /obj/item/storage/backpack
	//No shoes, but a terrible shirt and a top hat, has backpack

/datum/outfit/florida_man_three
	name = "Florida Man Superhero"
	uniform = /obj/item/clothing/under/misc/patriotsuit
	head = /obj/item/clothing/head/helmet/justice
	ears = /obj/item/radio/headset
	shoes = /obj/item/clothing/shoes/combat
	//Some kind of heroic outfit, no backpack

/datum/outfit/florida_man_four
	name = "Florida Man Nudist"
	shoes = /obj/item/clothing/shoes/sandal
	back = /obj/item/storage/backpack
	//Shoes and backpack only

/obj/structure/closet/supplypod/car_pod
	style = STYLE_CAR
	explosionSize = list(0,0,1,2)
	delays = list(POD_TRANSIT = 15, POD_FALLING = 4, POD_OPENING = 30, POD_LEAVING = 30)

/obj/structure/closet/supplypod/washer_pod
	style = STYLE_WASHER
	explosionSize = list(0,0,1,2)
	delays = list(POD_TRANSIT = 15, POD_FALLING = 4, POD_OPENING = 30, POD_LEAVING = 30)
