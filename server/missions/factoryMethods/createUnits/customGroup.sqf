// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: customGroup.sqf
//	@file Author: AgentRev

if (!isServer) exitWith {};

private ["_group", "_pos", "_nbUnits", "_unitTypes", "_uPos", "_unit"];

_group = _this select 0;
_pos = _this select 1;
_nbUnits = param [2, 7, [0]];
_radius = param [3, 10, [0]];

_unitTypes =
[
	"C_man_polo_1_F", "C_man_polo_1_F_euro", "C_man_polo_1_F_afro", "C_man_polo_1_F_asia",
	"C_man_polo_2_F", "C_man_polo_2_F_euro", "C_man_polo_2_F_afro", "C_man_polo_2_F_asia",
	"C_man_polo_3_F", "C_man_polo_3_F_euro", "C_man_polo_3_F_afro", "C_man_polo_3_F_asia",
	"C_man_polo_4_F", "C_man_polo_4_F_euro", "C_man_polo_4_F_afro", "C_man_polo_4_F_asia",
	"C_man_polo_5_F", "C_man_polo_5_F_euro", "C_man_polo_5_F_afro", "C_man_polo_5_F_asia",
	"C_man_polo_6_F", "C_man_polo_6_F_euro", "C_man_polo_6_F_afro", "C_man_polo_6_F_asia"
];

for "_i" from 1 to _nbUnits do
{
	_uPos = _pos vectorAdd ([[random _radius, 0, 0], random 360] call BIS_fnc_rotateVector2D);
	_unit = _group createUnit [_unitTypes call BIS_fnc_selectRandom, _uPos, [], 0, "Form"];
	_unit setPosATL _uPos;

	removeAllWeapons _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;
	removeGoggles _unit;

	_unit addVest "CUP_V_B_GER_Carrier_Rig";
	_unit addMagazine "CUP_30Rnd_545x39_AK_M";
	_unit addMagazine "CUP_30Rnd_545x39_AK_M";
	_unit addMagazine "CUP_30Rnd_545x39_AK_M";


	switch (true) do
	{
		// Grenadier every 3 units
		case (_i % 3 == 0):
		{
			_unit addUniform "U_B_CombatUniform_mcam_vest";
			_unit addMagazine "CUP_1Rnd_HE_GP25_M";
			_unit addWeapon "CUP_arifle_AK74_GL";
			_unit addMagazine "CUP_1Rnd_HE_GP25_M";
			_unit addMagazine "CUP_1Rnd_HE_GP25_M";
		};
		// RPG every 7 units, starting from second one
		case ((_i + 5) % 7 == 0):
		{
			_unit addUniform "CUP_U_O_Partisan_TTsKO_Mixed";
			_unit addBackpack "B_Kitbag_mcamo";
			_unit addWeapon "CUP_arifle_AKS74_kobra";
			_unit addMagazine "CUP_PG7V_M";
			_unit addWeapon "CUP_launch_RPG7V";
			_unit addMagazine "CUP_PG7V_M";
			_unit addMagazine "CUP_PG7V_M";
		};
		// Rifleman
		default
		{
			_unit addUniform "CUP_U_I_GUE_Flecktarn2";

			if (_unit == leader _group) then
			{
				_unit addUniform "U_I_G_resistanceLeader_F";
				_unit addWeapon "CUP_arifle_AKS74_pso";
				_unit setRank "SERGEANT";
			}
			else
			{
				_unit addWeapon "CUP_arifle_AK74";
			};
		};
	};


	_unit addRating 1e11;
	_unit spawn addMilCap;
	_unit spawn refillPrimaryAmmo;
	_unit call setMissionSkill;
	_unit addEventHandler ["Killed", server_playerDied];
};

[_group, _pos] call defendArea;
