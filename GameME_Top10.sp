#include <sourcemod>
#include <sdktools>
#include <gameme>

#pragma semicolon 1
#pragma newdecls required

public Plugin myinfo =
{
	name = "GameME Top10 VIP",
	author = "Twist",
	description = "",
	version = "1.2.9",
	url = "https://github.com/Twist-y"
};

public void OnClientAuthorized(int client)
{
  	  if (client > 0) {
  	    if (!IsFakeClient(client)) {
  	      QueryGameMEStats("playerinfo", client, QuerygameMEStatsCallback);
  	    }
  	}
}
public Action QuerygameMEStatsCallback(int command, int payload, int client, Handle datapack)
{
  	if ((client > 0) && (command == RAW_MESSAGE_CALLBACK_PLAYER)) {
  	
  	    Handle data = CloneHandle(datapack);
 	    ResetPack(data);
  	
  	    int rank = ReadPackCell(data);

  	    if (rank <= 10) {
            AddUserFlags(client, Admin_Reservation);
  	    }
  	  }
}