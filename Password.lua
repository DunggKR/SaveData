-- Define passwords and their custom messages + URLs
local Passwords = {
  hamzah = "✅ Hello bitch madafaka, enjoy your 1 day trial period.",
  NIKA = "✅ Hello NIKA! Time to access your zone.",
  TGN = "✅ TGN detected. Launching your command...",
  ADMIN = "✅ Admin login approved."
}

local URLs = {
  hamzah = "https://raw.githubusercontent.com/DunggKR/SaveData/main/Hamzah/Expiry_Date_Check.lua",
  NIKA = "https://raw.githubusercontent.com/DunggKR/DC-Script/main/nika.lua",
  TGN = "https://raw.githubusercontent.com/DunggKR/DC-Script/main/tgn.lua",
  ADMIN = "https://raw.githubusercontent.com/DunggKR/DC-Script/main/admin.lua"
}

-- Prompt user to enter password
local Menu = gg.prompt({"Enter Password:"}, nil, {"text"})
if not Menu then return end

local input = Menu[1]

-- Check if valid password
if not Passwords[input] or not URLs[input] then
  gg.alert("⚠ Error Password ⚠")
  return
end

-- Show alert first
gg.alert(Passwords[input])

-- Make silent request and store content
local L = gg.makeRequest(URLs[input]).content

if not L or L == '' then
  gg.alert('SERVER: Allow Internet Connection...')
else
  local f = load(L)
  if f then pcall(f)
  else gg.alert('SERVER: Invalid script content') end
end
-- Optional: auto-run it
-- load(L)()
