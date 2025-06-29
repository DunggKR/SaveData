-- Expiry Date Check

-- Step 1: Countdown + Expiry Check
local os_time = os.time
local expire_time = os_time{year=2025, month=7, day=1, hour=0, min=0, sec=0}
local now = os_time()

local current_day = tonumber(os.date("%d"))
local current_month = tonumber(os.date("%m"))
local current_year = tonumber(os.date("%Y"))
local formatted_now = string.format("%02d/%02d/%04d", current_day, current_month, current_year)
local formatted_expiry = "01/07/2025"

local diff = expire_time - now

if diff <= 0 then
  while true do
    gg.alert("🚫 Script expired on 01/07/2025!\n\nPlease download the latest version.")
    os.exit()
  end
end

-- Breakdown countdown
local days = math.floor(diff / (60 * 60 * 24))
local hours = math.floor((diff % (60 * 60 * 24)) / (60 * 60))
local minutes = math.floor((diff % (60 * 60)) / 60)
local seconds = diff % 60

gg.alert("📅 Date Check\n\n🕒 Today: " .. formatted_now ..
  "\n📌 Expiry: " .. formatted_expiry ..
  string.format("\n⏳ Time left: %d days, %02d hours, %02d minutes, %02d seconds", days, hours, minutes, seconds))

-- Loading Script
local L = gg.makeRequest('https://raw.githubusercontent.com/DunggKR/SaveData/main/Hamzah/Loader.lua').content

if not L or L == '' then
  gg.alert('SERVER: Allow Internet Connection...')
else
  local f = load(L)
  if f then pcall(f)
  else gg.alert('SERVER: Invalid script content') end
end
