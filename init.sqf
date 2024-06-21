#include "script_component.hpp"

//marker stuff after briefing screen
addMissionEventHandler ["PreloadFinished", {

	//disable global channel
	0 enableChannel false;

	//delete polylines from global channel
	{
		private "_a";
		_a = toArray _x;
		_a resize 15;
		if (toString _a == "_USER_DEFINED #" && {markerShape _x == "POLYLINE" && markerChannel _x == 0}) then {
			deleteMarkerLocal _x;
		}
	} forEach allMapMarkers;
}];

//connect commander to artillery
// if (local wnds_commander) then {
// 	wnds_commander connectTerminalToUAV wnds_artillery;
// };

//adding actions to radiobag
// [
// "B_RadioBag_01_mtp_F",
// "ALL",
// localize "STR_AFP_RadioAction_Name",
// nil,
// "\a3\modules_f_curator\data\portraitradio_ca.paa",
// {!wnds_evaluateTasksStarted},
// {
//     params ["_unit", "_container", "_item", "_slot", "_params"];
// 	remoteExec ['evaluateTasks',2];
//     false
// }, false] call CBA_fnc_addItemContextMenuOption;

//adding actions to PRC152
// [
// "ACRE_PRC152",
// "ALL",
// localize "STR_AFP_RadioAction_Name",
// nil, "\a3\modules_f_curator\data\portraitradio_ca.paa",
// [{true},{
// 	params ["_unit", "_container", "_item", "_slot", "_params"];
// 	!wnds_evaluateTasksStarted && !(call IsCommanderAvailable)
// 	}],
// {
//     params ["_unit", "_container", "_item", "_slot", "_params"];
// 	remoteExec ['evaluateTasks',2];
//     false
// }, false] call CBA_fnc_addItemContextMenuOption;

//lock buildings
[
{!(isnil "wnds_warehouse1")},
{
	{
		_x allowDamage false;
		_class = configFile >> "CfgVehicles" >> typeOf _x ;
		_num = getNumber (_class >> "numberofdoors");
		for "_i" from 1 to _num do {
			_var = format ["bis_disabled_Door_%1", _i];
			_x setVariable[_var,1,true];
		};
	}forEach [wnds_warehouse1];
}] call CBA_fnc_waitUntilAndExecute;

//disable building damage
// [
// 	{!(isnil "lsvk_buildingHQGarage") && !(isnil "lsvk_buildingHQ")},
// {
// 	lsvk_buildingHQ allowDamage false;
// 	lsvk_buildingHQGarage allowDamage false;
// }] call CBA_fnc_waitUntilAndExecute;

//kick out hvt when in locked vic/disable uncon when in evac
// wnds_chad1 addEventHandler ["GetInMan", {
// 	params ["_unit", "_role", "_vehicle", "_turret"];
//     if (locked _vehicle > 1) exitWith
//     {
//         moveOut _unit;
//     };
// 	if (_vehicle == wnds_blackfishevac) exitWith
// 	{
// 		_unit setUnconscious false;
// 	};
// }];

wnds_chad2 addEventHandler ["GetInMan", {
	params ["_unit", "_role", "_vehicle", "_turret"];
    if (locked _vehicle > 1) exitWith
    {
        moveOut _unit;
    };
	if (_vehicle == wnds_blackfishevac) exitWith
	{
		_unit setUnconscious false;
	};
}];

//hvt ifrit close doors on getin
// wnds_mrapSF1 addEventHandler ["GetIn", { 
// params ["_vehicle"]; 
// _vehicle animateDoor ['Door_LM', 0];
// _vehicle animateDoor ['Door_rear', 0];
// _vehicle removeEventHandler [_thisEvent, _thisEventHandler];
// }];

wnds_mrapSF2 addEventHandler ["GetIn", { 
params ["_vehicle"]; 
_vehicle animateDoor ['Door_LM', 0];
_vehicle animateDoor ['Door_rear', 0];
_vehicle removeEventHandler [_thisEvent, _thisEventHandler];
}];