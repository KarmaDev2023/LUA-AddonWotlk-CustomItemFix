--[[

  DIF : Fixateur d'ID d'affichage par KarmaDev
		Module complémentaire pour corriger l'icône de point d'interrogation de vos SQL Items personnalisés.
    
    
  Copyright (c) 2024 par KarmaDev
  L'autorisation est accordée de copier, distribuer et/ou modifier ce document
  selon les termes de la licence de documentation gratuite GNU, version 1.2
  ou toute version ultérieure publiée par la Free Software Foundation
  sans sections invariantes, sans textes de couverture et sans couverture arrière
  Des textes. Une copie de la licence est incluse dans la section intitulée "GNU
  Licence de documentation gratuite".

]]

if( DEFAULT_CHAT_FRAME ) then
	DEFAULT_CHAT_FRAME:AddMessage("|cffff8000Display IDs Fixer par KarmaDev chargé avec succès !|r");
end

WOW_GetContainerItemInfo = GetContainerItemInfo;

function GetContainerItemInfo(index, id)

local texture, itemCount, locked, quality, readable;
texture, itemCount, locked, quality, readable = WOW_GetContainerItemInfo(index, id);

if( texture and string.find(texture,"INV_Misc_QuestionMark") ) then
	local itemlink = GetContainerItemLink(index, id);
	local itemid = 0;

	local itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount,
	itemEquipLoc, itemTexture = GetItemInfo(itemlink)

	if( itemlink ) then
		_, _, itemid = string.find(itemlink, "Hitem:(%d+):");
		texture = itemTexture;
	end
end

return texture, itemCount, locked, quality, readable;

end