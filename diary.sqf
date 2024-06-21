// if (!hasInterface) exitWith {};
// waitUntil {!isNull player};

//change signal according to player group
SignalContents = "";

if((player in (units wnds_groupFox10)) && SignalContents == "")then{
    SignalContents = "STR_AFP_Diary_Signal_ContentsFox10";
};
if((player in (units wnds_groupFox11)) && SignalContents == "")then{
    SignalContents = "STR_AFP_Diary_Signal_ContentsFox11";
};
if((player in (units wnds_groupFox12)) && SignalContents == "")then{
    SignalContents = "STR_AFP_Diary_Signal_ContentsFox12";
};
if((player in (units wnds_groupFox13)) && SignalContents == "")then{
    SignalContents = "STR_AFP_Diary_Signal_ContentsFox13";
};
if(SignalContents == "")then{
    SignalContents = "STR_AFP_Diary_Signal_Contents";
};

//briefing
player createDiaryRecord ["Diary",[localize "STR_AFP_Diary_Signal_Title", localize SignalContents]];

player createDiaryRecord ["Diary",[localize "STR_AFP_Diary_Execution_Title", localize "STR_AFP_Diary_Execution_Contents"]];

player createDiaryRecord ["Diary",[localize "STR_AFP_Diary_Mission_Title", localize "STR_AFP_Diary_Mission_Contents"]];

player createDiaryRecord ["Diary",[localize "STR_AFP_Diary_Situation_Title", localize "STR_AFP_Diary_Situation_Contents"]];

//tasks
["prepare", west, "prepareDescription", objNull, "CREATED", 1, false, false, "wait"] call BIS_fnc_setTask;

["paradrop", west, "paradropDescription", objNull, "CREATED", 1, false, false, "land"] call BIS_fnc_setTask;

["clear", west, "clearDescription", objNull, "CREATED", 1, false, false, "airdrop"] call BIS_fnc_setTask;

["locate", west, "locateDescription", objNull, "CREATED", 1, false, false, "search"] call BIS_fnc_setTask;

["hvt", west, "hvtDescription", objNull, "CREATED", 1, false, false, "target"] call BIS_fnc_setTask;

["evac", west, "evacDescription", objNull, "CREATED", 1, false, false, "run"] call BIS_fnc_setTask;