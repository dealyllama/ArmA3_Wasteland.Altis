// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 2.1
//	@file Name: mission_MoneyShipment.sqf
//	@file Author: JoSchaap / routes by Del1te - (original idea by Sanjo), AgentRev
//	@file Created: 31/08/2013 18:19

if (!isServer) exitwith {};
#include "moneyMissionDefines.sqf";

private ["_MoneyShipment", "_moneyAmount", "_convoys", "_vehChoices", "_moneyText", "_vehClasses", "_createVehicle", "_vehicles", "_veh2", "_leader", "_speedMode", "_waypoint", "_vehicleName", "_numWaypoints", "_cash"];

_setupVars =
{
	_locationsArray = LandConvoyPaths;

	// Money Shipments settings
	// Difficulties : Min = 1, Max = infinite
	// Convoys per difficulty : Min = 1, Max = infinite
	// Vehicles per convoy : Min = 1, Max = infinite
	// Choices per vehicle : Min = 1, Max = infinite
	_MoneyShipment =
	[
		// Easy
		[
			"Small Money Shipment", // Marker text
			25000, // Money
			[
				[ // NATO convoy
					["CUP_B_HMMWV_Crows_M2_USA", "CUP_B_HMMWV_Crows_MK19_USA"], // Veh 1
					["CUP_B_HMMWV_Crows_M2_USA", "CUP_B_Jackal2_GMG_GB_W"] // Veh 2
				],
				[ // Indie Convoy
					["CUP_B_HMMWV_Crows_MK19_USA", "CUP_O_UAZ_SPG9_TKA"], // Veh 1
					["CUP_B_Dingo_CZ_Wdl", "CUP_B_Dingo_GL_GER_Wdl"] // Veh 2
				],
				[ // Random
					["CUP_B_Jackal2_L2A1_GB_W", "CUP_B_HMMWV_Avenger_USA"], // Veh 1
					["CUP_O_UAZ_SPG9_TKA", "CUP_B_Dingo_CZ_Wdl"] // Veh 2
				]
			]
		],
		// Medium
		[
			"Medium Money Shipment", // Marker text
			50000, // Money
			[
				[ // NATO convoy
					["CUP_B_HMMWV_Crows_M2_USA", "CUP_B_HMMWV_Crows_MK19_USA"], // Veh 1
					["CUP_B_LAV25M240_USMC", "CUP_I_BRDM2_UN", "CUP_B_M113_USA"], // Veh 2
					["CUP_B_HMMWV_Avenger_USA", "CUP_B_HMMWV_Crows_MK19_USA"] // Veh 3
				],
				[ // Warsaw
					["CUP_O_UAZ_SPG9_TKA", "CUP_B_Dingo_CZ_Wdl"], // Veh 1
					["CUP_I_BMP1_TK_GUE", "CUP_O_BRDM2_CHDKZ", "CUP_O_BRDM2_ATGM_SLA"], // Veh 2
					["CUP_O_UAZ_SPG9_TKA", "CUP_B_Dingo_CZ_Wdl"] // Veh 3
				],
				[ // Indie convoy
					["CUP_I_SUV_Armored_ION", "CUP_B_HMMWV_Crows_MK19_USA"], // Veh 1
					["CUP_I_BMP1_TK_GUE", "CUP_O_BRDM2_CHDKZ"], // Veh 2
					["CUP_O_UAZ_SPG9_TKA", "CUP_B_Dingo_CZ_Wdl"] // Veh 3
				]
			]
		],
		// Hard
		[
			"Large Money Shipment", // Marker text
			75000, // Money
			[
				[ // NATO convoy
					["CUP_B_LAV25M240_USMC", "CUP_I_BRDM2_UN", "CUP_B_M113_USA"], // Veh 1
					["CUP_B_M1A2_TUSK_MG_US_Army", "CUP_B_M6LineBacker_USA_W"], // Veh 2
					["CUP_B_LAV25M240_USMC", "CUP_I_BRDM2_UN", "CUP_B_M113_USA"] // Veh 3
				],
				[ // Warsaw convoy
					["CUP_I_BMP1_TK_GUE", "CUP_O_BRDM2_CHDKZ", "CUP_O_ZSU23_ChDKZ"], // Veh 1
					["CUP_O_T72_SLA"], // Veh 2
					["CUP_I_BMP1_TK_GUE", "CUP_O_BRDM2_CHDKZ", "CUP_O_ZSU23_ChDKZ"] // Veh 3
				],
				[ // Indie convoy
					["CUP_I_SUV_Armored_ION", "I_MRAP_03_gmg_F"], // Veh 1
					["CUP_O_T72_SLA", "CUP_B_M1A2_TUSK_MG_US_Army"], // Veh 2
					["CUP_O_UAZ_SPG9_TKA", "CUP_B_Dingo_CZ_Wdl"] // Veh 3
				]
			]
		],
		// Extreme
		[
			"Heavy Money Shipment", // Marker text
			100000, // Money
			[
				[ // NATO convoy
					["CUP_B_LAV25M240_USMC", "CUP_I_BRDM2_UN", "CUP_B_M113_USA", "CUP_B_M1A2_TUSK_MG_US_Army", "CUP_B_M6LineBacker_USA_W", "CUP_B_M163_USA"], // Veh 1
					["CUP_B_HMMWV_Avenger_USA", "CUP_I_BRDM2_UN", "CUP_B_M113_USA", "CUP_B_M163_USA"], // Veh 2
					["CUP_B_LAV25M240_USMC", "CUP_I_BRDM2_UN", "CUP_B_M113_USA", "CUP_B_M1A2_TUSK_MG_US_Army", "CUP_B_M6LineBacker_USA_W", "CUP_B_M163_USA"], // Veh 3
					["CUP_B_LAV25M240_USMC", "CUP_I_BRDM2_UN", "CUP_B_M113_USA", "CUP_B_M1A2_TUSK_MG_US_Army", "CUP_B_M6LineBacker_USA_W", "CUP_B_M163_USA"] // Veh 4
				],
				[ // Warsaw convoy
					["CUP_I_BMP1_TK_GUE", "CUP_O_BRDM2_CHDKZ", "CUP_O_ZSU23_ChDKZ", "CUP_O_T72_SLA"], // Veh 1
					["CUP_I_BMP1_TK_GUE", "CUP_O_BRDM2_CHDKZ", "CUP_O_ZSU23_ChDKZ", "CUP_O_T72_SLA"], // Veh 2
					["CUP_I_BMP1_TK_GUE", "CUP_O_BRDM2_CHDKZ", "CUP_O_ZSU23_ChDKZ", "CUP_O_T72_SLA"], // Veh 3
					["CUP_I_BMP1_TK_GUE", "CUP_O_BRDM2_CHDKZ", "CUP_O_ZSU23_ChDKZ", "CUP_O_T72_SLA"] // Veh 4
				],
				[ // Indie convoy
					["CUP_I_SUV_Armored_ION", "CUP_B_HMMWV_Crows_MK19_USA", "CUP_O_T72_SLA", "CUP_B_M1A2_TUSK_MG_US_Army","CUP_O_ZSU23_ChDKZ", "CUP_B_Dingo_CZ_Wdl"], // Veh 1
					["CUP_I_SUV_Armored_ION", "CUP_B_HMMWV_Crows_MK19_USA", "CUP_O_T72_SLA", "CUP_B_M1A2_TUSK_MG_US_Army","CUP_O_ZSU23_ChDKZ", "CUP_B_Dingo_CZ_Wdl"], // Veh 2
					["CUP_I_SUV_Armored_ION", "CUP_B_HMMWV_Crows_MK19_USA", "CUP_O_T72_SLA", "CUP_B_M1A2_TUSK_MG_US_Army","CUP_O_ZSU23_ChDKZ", "CUP_B_Dingo_CZ_Wdl"], // Veh 3
					["CUP_I_SUV_Armored_ION", "CUP_B_HMMWV_Crows_MK19_USA", "CUP_O_T72_SLA", "CUP_B_M1A2_TUSK_MG_US_Army","CUP_O_ZSU23_ChDKZ", "CUP_B_Dingo_CZ_Wdl"] // Veh 4
				]
			]
		]
	]
	call BIS_fnc_selectRandom;

	_missionType = _MoneyShipment select 0;
	_moneyAmount = _MoneyShipment select 1;
	_convoys = _MoneyShipment select 2;
	_vehChoices = _convoys call BIS_fnc_selectRandom;

	_moneyText = format ["$%1", [_moneyAmount] call fn_numbersText];

	_vehClasses = [];
	{ _vehClasses pushBack (_x call BIS_fnc_selectRandom) } forEach _vehChoices;
};

_setupObjects =
{
	private ["_starts", "_startDirs", "_waypoints"];
	call compile preprocessFileLineNumbers format ["mapConfig\convoys\%1.sqf", _missionLocation];

	_createVehicle =
	{
		private ["_type", "_position", "_direction", "_vehicle", "_soldier"];

		_type = _this select 0;
		_position = _this select 1;
		_direction = _this select 2;

		_vehicle = createVehicle [_type, _position, [], 0, "None"];
		_vehicle setVariable ["R3F_LOG_disabled", true, true];
		[_vehicle] call vehicleSetup;

		_vehicle setDir _direction;
		_aiGroup addVehicle _vehicle;

		_soldier = [_aiGroup, _position] call createRandomSoldier;
		_soldier moveInDriver _vehicle;

		_soldier = [_aiGroup, _position] call createRandomSoldier;
		_soldier moveInCargo [_vehicle, 0];

		if !(_type isKindOf "Truck_F") then
		{
			_soldier = [_aiGroup, _position] call createRandomSoldier;
			_soldier moveInGunner _vehicle;

			_soldier = [_aiGroup, _position] call createRandomSoldier;

			if (_vehicle emptyPositions "commander" > 0) then
			{
				_soldier moveInCommander _vehicle;
			}
			else
			{
				_soldier moveInCargo [_vehicle, 1];
			};
		};

		[_vehicle, _aiGroup] spawn checkMissionVehicleLock;

		_vehicle
	};

	_aiGroup = createGroup CIVILIAN;

	_vehicles = [];
	{
		_vehicles pushBack ([_x, _starts select 0, _startdirs select 0, _aiGroup] call _createVehicle);
	} forEach _vehClasses;

	_veh2 = _vehClasses select (1 min (count _vehClasses - 1));

	_leader = effectiveCommander (_vehicles select 0);
	_aiGroup selectLeader _leader;

	_aiGroup setCombatMode "GREEN"; // units will defend themselves
	_aiGroup setBehaviour "SAFE"; // units feel safe until they spot an enemy or get into contact
	_aiGroup setFormation "STAG COLUMN";

	_speedMode = if (missionDifficultyHard) then { "NORMAL" } else { "LIMITED" };

	_aiGroup setSpeedMode _speedMode;

	{
		_waypoint = _aiGroup addWaypoint [_x, 0];
		_waypoint setWaypointType "MOVE";
		_waypoint setWaypointCompletionRadius 25;
		_waypoint setWaypointCombatMode "GREEN";
		_waypoint setWaypointBehaviour "SAFE"; // safe is the best behaviour to make AI follow roads, as soon as they spot an enemy or go into combat they WILL leave the road for cover though!
		_waypoint setWaypointFormation "STAG COLUMN";
		_waypoint setWaypointSpeed _speedMode;
	} forEach _waypoints;

	_missionPos = getPosATL leader _aiGroup;

	_missionPicture = getText (configFile >> "CfgVehicles" >> _veh2 >> "picture");
	_vehicleName = getText (configFile >> "cfgVehicles" >> _veh2 >> "displayName");

	_missionHintText = format ["A convoy transporting <t color='%1'>%2</t> escorted by a <t color='%1'>%3</t> is en route to an unknown location.<br/>Stop them!", moneyMissionColor, _moneyText, _vehicleName];

	_numWaypoints = count waypoints _aiGroup;
};

_waitUntilMarkerPos = {getPosATL _leader};
_waitUntilExec = nil;
_waitUntilCondition = {currentWaypoint _aiGroup >= _numWaypoints};

_failedExec = nil;

// _vehicles are automatically deleted or unlocked in missionProcessor depending on the outcome

_successExec =
{
	// Mission completed

	for "_i" from 1 to 10 do
	{
		_cash = createVehicle ["Land_Money_F", _lastPos, [], 5, "None"];
		_cash setPos ([_lastPos, [[2 + random 3,0,0], random 360] call BIS_fnc_rotateVector2D] call BIS_fnc_vectorAdd);
		_cash setDir random 360;
		_cash setVariable ["cmoney", _moneyAmount / 10, true];
		_cash setVariable ["owner", "world", true];
	};

	_successHintMessage = "The convoy has been stopped, the money and vehicles are now yours to take.";
};

_this call moneyMissionProcessor;
