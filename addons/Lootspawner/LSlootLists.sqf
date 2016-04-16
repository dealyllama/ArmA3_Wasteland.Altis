// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	Lootspawner junction lists for classes to spawn-/lootable items
//	Author: Na_Palm (BIS forums)
//-------------------------------------------------------------------------------------
//here place Weapons an usable items (ex.: Binocular, ...)
//used with addWeaponCargoGlobal
//"lootWeapon_list" array of [class, [weaponlist]]
//                              class       : 0-civil, 1-military, ... (add more as you wish)
//                              weaponlist  : list of weapon class names
lootWeapon_list =
[
	[ // CIVIL
		0,
		[
			"CUP_hgun_Duty",
			"CUP_hgun_Colt1911",
			"CUP_hgun_TaurusTracker455",
			"CUP_srifle_LeeEnfield",
			"CUP_sgun_M1014"
		]
	],
	[ // MILITARY
		1,
		[
			"CUP_smg_MP5A5",
			"CUP_smg_MP5SD6",
			"CUP_smg_bizon",
			"CUP_arifle_AK74",
			"CUP_arifle_FNFAL_railed",
			"CUP_arifle_M16A4_Base",
			"CUP_srifle_M14_DMR",
			"CUP_srifle_M40A3",
			"CUP_srifle_Mk12SPR",
			"CUP_srifle_SVD",
			"CUP_srifle_VSSVintorez",
			"CUP_sgun_Saiga12K",
			
			//TODO - switch to arma 3 surpressors and scopes for more compatability
			//Scopes
			"muzzle_snds_L", // 9mm
			"muzzle_snds_M", // 5.56mm
			"muzzle_snds_H", // 6.5mm
			"muzzle_snds_H_MG", // 6.5mm LMG
			"muzzle_snds_B", // 7.62mm
			"muzzle_snds_acp", // .45 ACP
			"optic_Arco",
			"optic_SOS",
			"optic_Hamr",
			"optic_Aco",
			"optic_ACO_grn",
			"optic_aco_smg",
			"optic_Holosight",
			"optic_Holosight_smg",
			"acc_flashlight",
			"acc_pointer_IR",
			"CUP_optic_Kobra",
			"CUP_optic_PSO_1",
			"CUP_optic_PSO_3",
			"CUP_optic_PGO7V3",
			"CUP_optic_LeupoldMk4",

			//Attachments
			"acc_pointer_IR",


			//Supressors
//			"CUP_muzzle_snds_M16_camo",
//			"CUP_muzzle_snds_M14",
//			"CUP_muzzle_Bizon",
			"CUP_muzzle_PB6P9",
			"CUP_muzzle_PBS4",
			"CUP_muzzle_snds_M9",
			"CUP_muzzle_snds_L85"

		]
	],
	[ // INDUSTRIAL
		2,
		[
			"CUP_hgun_Duty",
			"CUP_hgun_Glock17",
			"CUP_hgun_TaurusTracker455",
			"CUP_srifle_LeeEnfield",
			"CUP_sgun_M1014"    
		]
	],
	[ // RESEARCH
		3,
		[
			"CUP_hgun_M9"
		]
	]
];

//here place magazines, weaponattachments and bodyitems(ex.: ItemGPS, ItemMap, Medikit, FirstAidKit, Binoculars, ...)
//used with addMagazineCargoGlobal
//"lootMagazine_list" array of [class, [magazinelist]]
//                              class       : 0-civil, 1-military, ... (add more as you wish)
//                              magazinelist: list of magazine class names
lootMagazine_list =
[
	[ // CIVIL
		0,
		[
			"16Rnd_9x21_Mag",
			"CUP_7Rnd_45ACP_1911",
			"CUP_6Rnd_45ACP_M"
		]
	],
	[ // MILITARY
		1,
		[
						"CUP_30Rnd_9x19_MP5",
			"CUP_64Rnd_9x19_Bizon_M",
			//"CUP_30Rnd_762x39_AK47_M",
			"CUP_20Rnd_762x51_FNFAL_M",
			"CUP_30Rnd_556x45_Stanag",
			"CUP_20Rnd_556x45_Stanag",
			"CUP_10Rnd_762x51_CZ750",
			"CUP_10x_303_M",
			"CUP_20Rnd_762x51_DMR",
			"CUP_5Rnd_762x51_M24",
			"CUP_10Rnd_762x54_SVD_M",
			"CUP_20Rnd_9x39_SP5_VSS_M",
			"CUP_8Rnd_B_Saiga12_74Slug_M",
			"CUP_8Rnd_B_Saiga12_74Pellets_M"
		]
	],
	[ // INDUSTRIAL
		2,
		[
			"16Rnd_9x21_Mag",
			"CUP_17Rnd_9x19_glock17",
			"CUP_7Rnd_45ACP_1911",
			"CUP_15Rnd_9x19_M9",
			"CUP_6Rnd_45ACP_M",
			"CUP_8Rnd_B_Beneli_74Slug",
			"CUP_8Rnd_B_Beneli_74Pellets"
		]
	],
	[ // RESEARCH
		3,
		[
			"16Rnd_9x21_Mag"
		]
	]
];

//here place hats, glasses, clothes, uniforms, vests
//used with addItemCargoGlobal
//"lootItem_list" array of [class, [itemlist]]
//                              class       : 0-civil, 1-military, ... (add more as you wish)
//                              itemlist    : list of item class names
lootItem_list =
[
	[ // CIVIL
		0,
		[
				//Generic Gear
			"Binocular",
			"ItemCompass",
			"FirstAidKit",
			"ItemGPS",

			//Uniform


			//Chest Rigs
			"V_Press_F",

			//Hats - because people need to wear more hats.
			"H_Watchcap_blk",
			"H_StrawHat",
			"CUP_H_C_Ushanka_03",
			"H_Cap_grn_BI",
			"H_Cap_blk_CMMG",
			"H_Cap_grn",
			"H_Cap_police",
			"H_Cap_press"

		]
	],
	[ // MILITARY
		1,
		[
			"FirstAidKit",
			"ItemGPS",
			"Medikit",
			"Binocular",
			"ItemCompass",
			"ItemRadio",
			"Rangefinder",


		//Fashionable Headwear

			"CUP_H_Ger_Boonie_Flecktarn",
			"CUP_H_FR_BoonieMARPAT",
			"CUP_H_Ger_Boonie_desert",
			"H_HelmetB",
			"CUP_H_PMC_EP_Headset",
			"CUP_H_RACS_Helmet_DPAT",
			"CUP_H_RACS_Helmet_Headset_DPAT",
			"H_Shemag_olive",
			"CUP_H_TK_Helmet",
			"CUP_H_USMC_Crew_Helmet",
			"CUP_H_USMC_HelmetWDL",
			"CUP_H_USMC_Goggles_HelmetWDL",

			//Chest Rigs
			"CUP_V_O_SLA_Flak_Vest01",
			"CUP_V_I_Carrier_Belt",
			"CUP_V_B_GER_Carrier_Vest_2",
			"CUP_V_B_GER_Vest_1",
			"CUP_V_B_GER_Vest_2",
			"CUP_V_B_MTV_Pouches",
			"CUP_V_B_MTV_Marksman",
			"CUP_V_B_PilotVest",
			"CUP_V_I_RACS_Carrier_Vest",
			"CUP_V_B_RRV_MG",
			"CUP_V_B_RRV_Scout"
		]
	],
	[ // INDUSTRIAL
		2,
		[
			//Generic Gear
			"Binocular",
			"ItemCompass",
			"FirstAidKit",
			"ItemGPS",
			"ItemRadio",

			//Uniforms

			//Chest Rigs
			"V_Press_F",

			//Hats - because people need to wear more hats.
			"H_Bandanna_gry",
			"H_Bandanna_blu",
			"H_Bandanna_cbr",
			"CUP_H_FR_BandanaGreen",
			"H_Watchcap_blk",
			"H_StrawHat",
			"CUP_H_C_Ushanka_03",
			"H_Cap_grn_BI",
			"H_Cap_blk_CMMG",
			"H_Cap_grn",
			"H_Cap_police",
			"H_Cap_press"
		]
	],
	[ // RESEARCH
		3,
		[
			"FirstAidKit",
			"ItemGPS",
			"Medikit",
			"Binocular",
			"ItemCompass",
			"ItemRadio"
		]
	]
];

//here place backpacks, parachutes and packed drones/stationary
//used with addBackpackCargoGlobal
//"lootBackpack_list" array of [class, [backpacklist]]
//                              class       : 0-civil, 1-military, ... (add more as you wish)
//                              backpacklist: list of backpack class names
lootBackpack_list =
[
	[ // CIVIL
		0,
		[
			"B_FieldPack_blk",
			"B_FieldPack_cbr",
			"B_FieldPack_khk",
			"B_FieldPack_oucamo"
		]
	],
	[ // MILITARY
		1,
		[
			"B_FieldPack_blk",
			"B_FieldPack_cbr",
			"B_FieldPack_khk",
			"B_FieldPack_oucamo",
			"B_Kitbag_cbr",
			"B_Kitbag_rgr",
			"B_Kitbag_mcamo",
			"B_Kitbag_sgg",
			"B_Bergen_blk",
			"B_Bergen_rgr",
			"B_Bergen_mcamo",
			"B_Bergen_sgg",
			"B_Carryall_khk",
			"B_Carryall_mcamo",
			"B_Carryall_oli",
			"B_Carryall_oucamo"
		]
	],
	[ // INDUSTRIAL
		2,
		[
			"B_FieldPack_blk",
			"B_FieldPack_cbr",
			"B_FieldPack_khk",
			"B_FieldPack_oucamo",
			"B_Kitbag_cbr",
			"B_Kitbag_rgr",
			"B_Kitbag_mcamo",
			"B_Kitbag_sgg"
		]
	],
	[ // RESEARCH
		3,
		[
			"B_FieldPack_blk",
			"B_FieldPack_cbr",
			"B_FieldPack_khk",
			"B_FieldPack_oucamo",
			"B_Kitbag_cbr",
			"B_Kitbag_rgr",
			"B_Kitbag_mcamo",
			"B_Kitbag_sgg",
			"B_Bergen_blk",
			"B_Bergen_rgr",
			"B_Bergen_mcamo",
			"B_Bergen_sgg",
			"B_Carryall_khk",
			"B_Carryall_mcamo",
			"B_Carryall_oli",
			"B_Carryall_oucamo"
		]
	]
];

//here place any other objects(ex.: Land_Basket_F, Box_East_Wps_F, Land_Can_V3_F, ...)
//used with createVehicle directly
//"lootworldObject_list" array of [class, [objectlist]]
//                              class       : 0-civil, 1-military, ... (add more as you wish)
//                              objectlist  : list of worldobject class names
lootworldObject_list =
[
	[ // CIVIL
		0,
		[
			"Land_BakedBeans_F",                // food
			"Land_BakedBeans_F",                // food
			"Land_BottlePlastic_V2_F",          // water
			"Land_BottlePlastic_V2_F",          // water
			"Land_Can_V3_F",                    // energydrink
			"Land_Suitcase_F",                  // repairkit
			"Land_CanisterOil_F",               // syphon hose
			"Land_CanisterFuel_F"               // jerrycan
		]
	],
	[ // MILITARY
		1,
		[
			"Land_BakedBeans_F",                // food
			"Land_BottlePlastic_V2_F",          // water
			"Land_Can_V3_F",                    // energydrink
			"Land_Suitcase_F",                  // repairkit
			"Land_CanisterOil_F",               // syphon hose
			"Land_CanisterFuel_F"               // jerrycan
		]
	],
	[ // INDUSTRIAL
		2,
		[
			"Land_BakedBeans_F",                // food
			"Land_BottlePlastic_V2_F",          // water
			"Land_Can_V3_F",                    // energydrink
			"Land_Suitcase_F",                  // repairkit
			"Land_Suitcase_F",                  // repairkit
			"Land_CanisterOil_F",               // syphon hose
			"Land_CanisterOil_F",               // syphon hose
			"Land_CanisterFuel_F",              // jerrycan
			"Land_CanisterFuel_F"               // jerrycan
		]
	],
	[ // RESEARCH
		3,
		[
			"Land_BakedBeans_F",                // food
			"Land_BottlePlastic_V2_F",          // water
			"Land_Can_V3_F",                    // energydrink
			"Land_Suitcase_F",                  // repairkit
			"Land_CanisterOil_F",               // syphon hose
			"Land_CanisterFuel_F"               // jerrycan
		]
	]
];
