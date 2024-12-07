#include <sourcemod>
#include <sdktools>
#include <sdkhooks>

#define VERSION "1.0.0"

public Plugin myinfo = {
	name = "CSS Silencer default on",
	author = "Garamond",
	description = "USP and M4A1 have silencer on by default",
	version = VERSION,
	url = "https://github.com/garamond13/CSS-Silencer-default-on"
};

public void OnClientPutInServer(int client)
{
	SDKHook(client, SDKHook_WeaponEquip, on_weapon_equip);
}

Action on_weapon_equip(int client, int weapon)
{	
	char buffer[12];
	GetEdictClassname(weapon, buffer, sizeof(buffer));
	if (!strcmp(buffer, "weapon_usp") || !strcmp(buffer, "weapon_m4a1")) {
		SetEntProp(weapon, Prop_Send, "m_bSilencerOn", 1);
		SetEntProp(weapon, Prop_Send, "m_weaponMode", 1);
	}
	return Plugin_Continue;
}