AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("cl_init.lua")
include("shared.lua")

function ENT:Initialize()
	self:SetModel( "models/items/boxmrounds.mdl" )
	self:SetMoveType( MOVETYPE_VPHYSICS )
	self:SetSolid( SOLID_VPHYSICS )
	self:SetUseType(SIMPLE_USE)
	

	if ( SERVER ) then self:PhysicsInit( SOLID_VPHYSICS ) end

	local phys = self:GetPhysicsObject()
	if ( IsValid( phys ) ) then phys:Wake() end
	end

function ENT:SpawnFunction( ply, tr, ClassName )

	if ( !tr.Hit ) then return end

	local SpawnPos = ply:GetShootPos() + ply:GetForward()*80

	local ent = ents.Create( ClassName )
	ent:SetPos(SpawnPos)
	ent:Spawn()
	ent:Activate()
	return ent
end

local BlacklistedWeapons = {
"m9k_milkormgl",
"m9k_sticky_grenade",
"m9k_ex41",
"m9k_m61_frag",
"m9k_harpoon",
"m9k_ied_detonator",
"m9k_knife",
"m9k_m202",
"m9k_m79gl",
"m9k_machete",
"m9k_matador",
"m9k_milkormgl",
"m9k_nerve_gas",
"m9k_nitro",
"m9k_orbital_strike",
"m9k_proxy_mine",
"m9k_rpg7",
"m9k_suicide_bomb",
"seal6-claymore",
"weapon_hoff_thundergun",
"weapon_ak47_beast",
"weapon_deagle_bornbeast",
"weapon_m4a1_beast",
"weapon_protonpack",
"weapon_gluongun",
"weapon_gpee",
"weapon_camo",
"weapon_bible",
"weapon_policeshield",
"ecm_weapon",
"weapon_lightsaber",
"sh_accessory_changer",
"weapon_sh_doorcharge",
"weapon_sh_keypadcracker_deploy",
"weapon_sh_detector",
"ttt_rcxd_deploy",
"pro_keypadcracker",
"realistic_hook",
}

function ENT:Use(activator, caller)
	local primaryAmmoType = activator:GetActiveWeapon():GetPrimaryAmmoType()
	if table.HasValue(BlacklistedWeapons, activator:GetActiveWeapon():GetClass()) then else 
		activator:GiveAmmo(30, primaryAmmoType)
		self:Remove()
	end
	
	end
function ENT:Think()
end
