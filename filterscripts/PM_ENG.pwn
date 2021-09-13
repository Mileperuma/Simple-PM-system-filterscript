#define SSCANF_NO_NICE_FEATURES

#include <a_samp>
#include <sscanf2>
#include <zcmd>

#define FILTERSCRIPT

public OnFilterScriptInit()
{
    printf("Running PM Script by Lucifera");
    return 1;
}

CMD:pm(playerid, params[])
{
    new
		Pmer,
		MSG[128],
		str[128],
		PlayerName[MAX_PLAYER_NAME],
		giveplayer[MAX_PLAYER_NAME],
		PmSent[64];
    if (sscanf(params, "s[200]", Pmer, MSG))
    {
		SendClientMessage(playerid, -1, "Usage: /pm [Playerid] [MSG]");
		return 1;
	}
    if (!IsPlayerConnected(Pmer))
		return SendClientMessage(playerid, 0xFF0000FF, "Error: Inactive ID");
    if (strlen(MSG) < 1)
    {
		SendClientMessage(playerid, 0xFF0000FF, "Error: Your message must reach more than 1 charactor.");
		return 1;
	}
    else{
        GetPlayerName(playerid, PlayerName, sizeof(PlayerName));
        GetPlayerName(Pmer, giveplayer, sizeof(giveplayer));
        if (Pmer == playerid)
			return SendClientMessage(playerid, 0xFF0000FF, "Are you stupid?.. how you try to pm yourself?!");
        format(PmSent, sizeof(PmSent), ">>[PM] %s: %s",PlayerName, MSG);
        SendClientMessage(playerid, 0xFF599DFF, PmSent);
        format(str, sizeof(str), ">>[PM] %s: %s",PlayerName, MSG);
        SendClientMessage(Pmer, 0xFFC900FF, str);
        GameTextForPlayer(Pmer, "~n~~n~~n~~n~~n~~n~~n~~n~~y~New MSG", 3000, 3);
        PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);
        printf("%s to %s, %s", PlayerName, giveplayer, MSG);
    }
    return 1;
}

//======================================= END OF THE SCRIPT ======================================================
