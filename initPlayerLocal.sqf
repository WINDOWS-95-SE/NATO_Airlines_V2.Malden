#include "script_component.hpp"
params ["_player", "_didJIP"];

//limit viewdistance
setViewDistance 2000;
setObjectViewDistance 1500;

//create briefing and tasks
_null = [] execVM "diary.sqf";
wnds_evaluateTasksStarted = false;

//checks if commander exists (for radio actions)
IsCommanderAvailable = {
	if (isnil "wnds_commander") exitWith {false};
	if (isNull wnds_commander) exitWith {false};
	if (!alive wnds_commander) exitWith {false};
	true
};

// spectator bs
[{alive player}, {
    if (typeOf player isEqualTo "VirtualSpectator_F") then {
    	player setDamage 1;
    };
}, [], -1] call CBA_fnc_waitUntilAndExecute;

//radio channel setup
[
	{
		call acre_api_fnc_isInitialized
	},
	{

		if(player in (units wnds_groupFox10))exitWith{
			if ( !isNil { ["ACRE_PRC152"] call acre_api_fnc_getRadioByType } ) then { [["ACRE_PRC152"] call acre_api_fnc_getRadioByType, 1] call acre_api_fnc_setRadioChannel };
       		if ( !isNil { ["ACRE_PRC343"] call acre_api_fnc_getRadioByType } ) then { 
				[["ACRE_PRC343"] call acre_api_fnc_getRadioByType, 4] call acre_api_fnc_setRadioChannel;
				
				_personalRadio = ["ACRE_PRC343"] call acre_api_fnc_getRadioByType; 
				_handheldRadio = ["ACRE_PRC152"] call acre_api_fnc_getRadioByType; 
				[[_personalRadio, _handheldRadio]] call acre_api_fnc_setMultiPushToTalkAssignment;
			};
		};
		if(player in (units wnds_groupFox11))exitWith{
			if ( !isNil { ["ACRE_PRC152"] call acre_api_fnc_getRadioByType } ) then { [["ACRE_PRC152"] call acre_api_fnc_getRadioByType, 1] call acre_api_fnc_setRadioChannel };
       		if ( !isNil { ["ACRE_PRC343"] call acre_api_fnc_getRadioByType } ) then { 
				[["ACRE_PRC343"] call acre_api_fnc_getRadioByType, 1] call acre_api_fnc_setRadioChannel;
				
				_personalRadio = ["ACRE_PRC343"] call acre_api_fnc_getRadioByType; 
				_handheldRadio = ["ACRE_PRC152"] call acre_api_fnc_getRadioByType; 
				[[_personalRadio, _handheldRadio]] call acre_api_fnc_setMultiPushToTalkAssignment;
			};
		};
		if(player in (units wnds_groupFox12))exitWith{
			if ( !isNil { ["ACRE_PRC152"] call acre_api_fnc_getRadioByType } ) then { [["ACRE_PRC152"] call acre_api_fnc_getRadioByType, 1] call acre_api_fnc_setRadioChannel };
       		if ( !isNil { ["ACRE_PRC343"] call acre_api_fnc_getRadioByType } ) then { 
				[["ACRE_PRC343"] call acre_api_fnc_getRadioByType, 2] call acre_api_fnc_setRadioChannel;

				_personalRadio = ["ACRE_PRC343"] call acre_api_fnc_getRadioByType; 
				_handheldRadio = ["ACRE_PRC152"] call acre_api_fnc_getRadioByType; 
				[[_personalRadio, _handheldRadio]] call acre_api_fnc_setMultiPushToTalkAssignment;
			};
		};
		if(player in (units wnds_groupFox13))exitWith{
			if ( !isNil { ["ACRE_PRC152"] call acre_api_fnc_getRadioByType } ) then { [["ACRE_PRC152"] call acre_api_fnc_getRadioByType, 1] call acre_api_fnc_setRadioChannel };
       		if ( !isNil { ["ACRE_PRC343"] call acre_api_fnc_getRadioByType } ) then { 
				[["ACRE_PRC343"] call acre_api_fnc_getRadioByType, 3] call acre_api_fnc_setRadioChannel;

				_personalRadio = ["ACRE_PRC343"] call acre_api_fnc_getRadioByType; 
				_handheldRadio = ["ACRE_PRC152"] call acre_api_fnc_getRadioByType; 
				[[_personalRadio, _handheldRadio]] call acre_api_fnc_setMultiPushToTalkAssignment;
			};
		};
	}
] call CBA_fnc_waitUntilAndExecute;