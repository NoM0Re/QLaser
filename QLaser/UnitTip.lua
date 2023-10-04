function QLaser:unitTipInit()
    GameTooltip:HookScript("OnTooltipSetUnit", QLaser.HookSetUnit)
end

function QLaser.filterNote(note)
        local result = note:sub(1, 18)
    return result
end

function QLaser.HookSetUnit()
    local name = GameTooltip:GetUnit();
    local note = QDKP2_LaserNote[name]

    if(note ~= nil) then
        local main = QDKP2_GetMain(name)
        local mainColored = QLaser:formatName(main)
        local mainNote = QDKP2_LaserNote[main]
        local filteredmainNote = QLaser.filterNote(mainNote)

        local unitTip = "|cffffff00QDKP_Alts "..QLaser.version.."|r\n"

        unitTip = unitTip .. ("|cffffff00-----------------------------|r\n")

        unitTip = unitTip .. "" .. mainColored .. "|cFF00FF00 [Main] |r" .. (QDKP2online[main] and "|cff00ff00Online|r" or "|cffa6a6a6Offline|r") .. " ".. filteredmainNote .. "\n";

        if QDKP2_LaserAlts[main] ~= nil then
            for alt in pairs(QDKP2_LaserAlts[main]) do
                local altColored = QLaser:formatName(alt)
                local altNote = QDKP2_LaserNote[alt]
                local filteredaltNote = QLaser.filterNote(altNote)

                if(QDKP2_IsExternal(alt)) then
                    unitTip = unitTip .. altColored .. " external\n";
                else
                    unitTip = unitTip .. altColored .. " " .. (QDKP2online[alt] and "|cff00ff00Online|r" or "|cffa6a6a6Offline|r") .. " ".. filteredaltNote .. "\n";
                end
                
            end
        end

        unitTip = unitTip .. ("|cffffff00-----------------------------|r\n")
        unitTip = unitTip .. " >> DKP: |cff33ffcc" .. QDKP2_GetNet(main) .. "|r <<"

        GameTooltip:AddLine(unitTip, 0.8, 0.8, 0.8)
    end
end