#include <sdktools>
#include <sourcemod>

public Plugin:myinfo = {
	name 		= "Break PSC",
	author 		= "Cracky",
	description = "Break point_servercommand into .bsp files",
	version 	= "1.0",
	url = "https://github.com/CrackyStudio"
};

public OnPluginStart()
{
	HookEvent("round_start", OnRoundStart);
}

public Action:OnRoundStart(Handle:event, const String:name[], bool:dontBroadcast)
{
    new i = -1;
    new entity = 0;

    for (new n = 0; n <= 16; n++)
    {
        entity = FindEntityByClassname(i, "point_servercommand");
        if (IsValidEntity(entity))
        {
            AcceptEntityInput(entity, "Kill");
            i = entity;
        }
        else
            break;
    }
}