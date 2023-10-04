QLaser = LibStub("AceAddon-3.0"):NewAddon("QLaser", "AceEvent-3.0")
QLaser.version = "v1.2"

function QLaser:OnInitialize()
    self:unitTipInit();
end