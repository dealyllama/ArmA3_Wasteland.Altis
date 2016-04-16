// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: createRandomSoldier.sqf
/*
 * Creates a random civilian soldier.
 *
 * Arguments: [ position, group, init, skill, rank]: Array
 *    position: Position - Location unit is created at.
 *    group: Group - Existing group new unit will join.
 *    init: String - (optional, default "") Command to be executed upon creation of unit. Parameter this is set to the created unit and passed to the code.
 *    skill: Number - (optional, default 0.5)
 *    rank: String - (optional, default "PRIVATE")
 */

if (!isServer) exitWith {};

private ["_soldierTypes", "_uniformTypes", "_vestTypes", "_weaponTypes", "_group", "_position", "_rank", "_soldier"];

_soldierTypes = ["C_man_polo_1_F", "C_man_polo_2_F", "C_man_polo_3_F", "C_man_polo_4_F", "C_man_polo_5_F", "C_man_polo_6_F"];
_uniformTypes = [
					"CUP_U_B_CZ_WDL_TShirt",
					"CUP_U_B_GER_Flecktarn_2",
					"CUP_U_B_GER_Tropentarn_2",
					"CUP_U_B_GER_Flecktarn_1",
					"CUP_U_B_GER_Tropentarn_1",
					"CUP_O_TKI_Khet_Jeans_04",
					"CUP_O_TKI_Khet_Jeans_02",
					"CUP_O_TKI_Khet_Jeans_01",
					"CUP_O_TKI_Khet_Jeans_03",
					"CUP_U_B_USMC_Officer",
					"CUP_U_B_USMC_MARPAT_WDL_RollUpKneepad",
					"CUP_U_B_USMC_MARPAT_WDL_RolledUp",
					"CUP_U_B_USMC_MARPAT_WDL_Kneepad",
					"CUP_U_B_USMC_MARPAT_WDL_TwoKneepads",
					"CUP_U_B_USMC_MARPAT_WDL_Sleeves",
					"CUP_U_I_GUE_Flecktarn2",
					"CUP_U_I_GUE_Flecktarn3",
					"CUP_U_I_GUE_Flecktarn",
					"CUP_U_I_GUE_Woodland1",
					"CUP_B_USMC_Navy_Blue",
					"CUP_B_USMC_Navy_Brown",
					"CUP_B_USMC_Navy_Green",
					"CUP_U_I_RACS_Desert_2",
					"CUP_U_I_RACS_Urban_2",
					"CUP_U_I_RACS_Desert_1",
					"CUP_U_I_RACS_Urban_1",
					"CUP_U_B_FR_DirAction2",
					"CUP_U_B_FR_Corpsman",
					"CUP_U_B_FR_Light",
					"CUP_U_B_FR_Scout1",
					"CUP_U_B_FR_Scout2",
					"CUP_U_B_FR_Scout3",
					"CUP_U_B_FR_Scout"
				];

_vestTypes = 	[
					"CUP_V_O_SLA_Flak_Vest03",
					"CUP_V_O_SLA_Flak_Vest01",
					"CUP_V_O_SLA_Flak_Vest02",
					"CUP_V_I_Carrier_Belt",
					"V_Chestrig_blk",
					"V_Chestrig_rgr",
					"V_Chestrig_khk",
					"CUP_V_B_GER_Carrier_Vest",
					"CUP_V_B_GER_Carrier_Vest_3",
					"CUP_V_B_GER_Carrier_Vest_2",
					"CUP_V_B_GER_Carrier_Rig_2",
					"CUP_V_B_GER_Carrier_Rig_2_Brown",
					"CUP_V_B_GER_Carrier_Rig",
					"CUP_V_B_GER_Carrier_Rig_3_Brown",
					"CUP_V_B_GER_Vest_1",
					"CUP_V_B_GER_Vest_2",
					"CUP_V_B_RRV_DA2",
					"CUP_V_B_RRV_DA1",
					"CUP_V_B_MTV_Pouches",
					"CUP_V_B_MTV_PistolBlack",
					"CUP_V_B_MTV",
					"CUP_V_B_MTV_Mine",
					"CUP_V_B_MTV_LegPouch",
					"CUP_V_B_MTV_Marksman",
					"CUP_V_B_MTV_MG",
					"CUP_V_B_MTV_Patrol",
					"CUP_V_B_MTV_noCB",
					"CUP_V_B_MTV_TL",
					"CUP_V_B_PilotVest",
					"CUP_V_I_RACS_Carrier_Vest",
					"CUP_V_I_RACS_Carrier_Vest_3",
					"CUP_V_I_RACS_Carrier_Vest_2",
					"CUP_V_I_RACS_Carrier_Rig_2",
					"CUP_V_I_RACS_Carrier_Rig_3",
					"CUP_V_B_RRV_MG",
					"CUP_V_B_RRV_Medic",
					"CUP_V_B_RRV_Officer",
					"CUP_V_B_RRV_Scout",
					"CUP_V_B_RRV_Scout2",
					"CUP_V_B_RRV_Scout3",
					"CUP_V_B_RRV_TL",
					"CUP_V_O_TK_Vest_1",
					"CUP_V_O_TK_Vest_2"
				];

_weaponTypes = 	[
					"CUP_smg_MP5A5",
					"CUP_smg_MP5SD6",
					"CUP_smg_bizon",
					"CUP_arifle_AK74",
					"CUP_arifle_FNFAL_railed",
					"CUP_arifle_M16A4_Base",
					"CUP_lmg_M240"
				];

_group = _this select 0;
_position = _this select 1;
_rank = param [2, "", [""]];

_soldier = _group createUnit [_soldierTypes call BIS_fnc_selectRandom, _position, [], 0, "NONE"];
_soldier addUniform (_uniformTypes call BIS_fnc_selectRandom);
_soldier addVest (_vestTypes call BIS_fnc_selectRandom);
[_soldier, _weaponTypes call BIS_fnc_selectRandom, 3] call BIS_fnc_addWeapon;

if (_rank != "") then
{
	_soldier setRank _rank;
};

_soldier spawn refillPrimaryAmmo;
_soldier spawn addMilCap;
_soldier call setMissionSkill;

_soldier addEventHandler ["Killed", server_playerDied];

_soldier
