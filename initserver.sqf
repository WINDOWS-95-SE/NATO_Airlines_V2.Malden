#include "script_component.hpp"

//choose town to assault
private _towntoassault = "TownToAssault" call BIS_fnc_getParamValue;

if (_towntoassault isEqualTo 1) then {
  _towntoassault = "phase2_latrinite";
};

if (_towntoassault isEqualTo 2) then {
  _towntoassault = "phase2_larche";
};

if (_towntoassault isEqualTo 3) then {
  _towntoassault = selectRandom ["phase2_latrinite","phase2_larche"];
};

{ deleteVehicle _x } forEach ((getMissionLayerEntities _towntoassault ) select 0);

// hideObjectGlobal _x , deleteVehicle _x;

//af preset respawn marker stuff
if (!isNil QUOTE(RESPAWN_HELPER_VR)) then {
    createMarker ["respawn", position RESPAWN_HELPER_VR];
};

//create briefing and tasks
_null = [] execVM "diary.sqf";

//checks if commander exists (for radio actions)
IsCommanderAvailable = {
	if (isnil "wnds_commander") exitWith {false};
	if (isNull wnds_commander) exitWith {false};
	if (!alive wnds_commander) exitWith {false};
	true
};

//make hvt unconscious
0 spawn {
	sleep 10;
	// wnds_chad1 setUnconscious true;
	wnds_chad2 setUnconscious true;
};

//disable lambs for reinf helis idk
(group wnds_heli1) setVariable ["lambs_danger_disableGroupAI", true];
(group wnds_heli2) setVariable ["lambs_danger_disableGroupAI", true];
(group wnds_heli3) setVariable ["lambs_danger_disableGroupAI", true];

//hvt ifrit texture+doors
// wnds_mrapSF1 setObjectTextureGlobal [0, "MRAP_01.paa"];
// wnds_mrapSF1 setObjectTextureGlobal [1, "MRAP_02.paa"];
// wnds_mrapSF1 animateDoor ['Door_LM', 1, true];
// wnds_mrapSF1 animateDoor ['Door_rear', 1, true];

wnds_mrapSF2 setObjectTextureGlobal [0, "MRAP_01.paa"];
wnds_mrapSF2 setObjectTextureGlobal [1, "MRAP_02.paa"];
wnds_mrapSF2 animateDoor ['Door_LM', 1, true];
wnds_mrapSF2 animateDoor ['Door_rear', 1, true];

//end mission
wnds_evaluateTasksStarted = false;
evaluateTasks = {
	wnds_evaluateTasksStarted = true;
	publicVariable "lsvk_evaluateTasksStarted";
	_MuchLost = (blufor countSide allPlayers < 16);
	_CivAlive = alive wnds_chad2 && (wnds_chad2 inArea wnds_triggerEvacEnd);

	sleep 6;
	if(_CivAlive && _MuchLost) exitWith {["CivAliveMuchLost", true] remoteExecCall ['BIS_fnc_endMission',0]};
	if(!_CivAlive && _MuchLost) exitWith {["CivDeadMuchLost", false] remoteExecCall ['BIS_fnc_endMission',0]};
	if(_CivAlive) exitWith {["CivAlive", true] remoteExecCall ['BIS_fnc_endMission',0]};
	["CivDead", false] remoteExecCall ['BIS_fnc_endMission',0]
};