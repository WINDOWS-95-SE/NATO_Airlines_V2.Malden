#include "script_component.hpp"

// end mission if all dead
if((blufor countSide allPlayers) isEqualTo 0) exitWith{

    //systemChat str({alive _x} count allPlayers isEqualTo 0);
	
	if(alive wnds_chad2) then {
    	["AllDead", false] remoteExecCall ['BIS_fnc_endMission',0];
	} else {
		["AllDeadCivDead", false] remoteExecCall ['BIS_fnc_endMission',0];
	}
};