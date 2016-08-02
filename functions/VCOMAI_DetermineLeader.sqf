//Created on 8/14/14
// Modified on : 8/1/15

//This function is to determine if this unit is the group leader or not. And to define if unit is sub-leader or not.
_Unit = _this select 0;

_GroupLeader = leader (group (vehicle _Unit)); 
if (_GroupLeader isEqualTo _Unit) then {_VCOM_GroupLeader = true;} else {_VCOM_GroupLeader = false;};

_SubLeader = isFormationLeader _Unit;
if (_SubLeader) then {_VCOM_SubLeader = true;} else {_VCOM_SubLeader = false;};


_Leader = _VCOM_GroupLeader;
if (isNil "_Leader") exitWith {};
_SubLeader = _VCOM_SubLeader;
_CheckArray = [_Leader,_SubLeader];

//If leader is far away, lets regroup! YAY!
if (_Leader distance _Unit > 60) then {_Unit forcespeed -1;};

_CheckArray