function QLaser:formatName(name)
    local class=QDKP2class[name] or UnitClass(name)
    unitClassColor=QDKP2_GetClassColor(class)
    return "|cff"..QLaser:num2hex(unitClassColor.r * 255)..QLaser:num2hex(unitClassColor.g * 255)..QLaser:num2hex(unitClassColor.b * 255)..name.."|r";
end

function QLaser:num2hex(num)
  num = math.floor(num)
  local hexstr = '0123456789abcdef'
  local s = ''
  while num > 0 do
    local mod = math.fmod(num, 16)
    s = string.sub(hexstr, mod+1, mod+1) .. s
    num = math.floor(num / 16)
  end
  if s == '' then s = '0' end
  if(#s == 1) then s = '0'..s; end
  return s
end