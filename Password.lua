-- Passwords mapped to {alert message, request URL}
local PasswordMap = {
  ["hamzah"]   = {"Hello bitch, enjoy your 1 day trial period.", "https://raw.githubusercontent.com/DunggKR/SaveData/main/Hamzah/Expiry_Date_Check.lua"},
  ["NIKA"] = {"Hello NIKA! Time to access your zone.", "https://example.com/request2"},
  ["TGN"]  = {"TGN detected. Launching your command...", "https://example.com/request3"},
  -- Add more like this:
  -- ["password"] = {"Your custom alert", "https://your-link.com"}
}

-- Prompt user to enter password
local Menu = gg.prompt({"Select Password:"}, nil, {"text"})
if not Menu then return end

local input = Menu[1]
local entry = PasswordMap[input]

-- Check if password is valid
if not entry then
  gg.alert("⚠ Error Password ⚠")
  return
end

-- Extract values
local message = entry[1]
local url = entry[2]

-- Show custom alert and make request
gg.alert("✅ " .. message)
gg.toast("🔗 Sending request...")

local response = gg.makeRequest(url, nil, nil)

-- Show response or error
if response and response.content then
  gg.alert("📥 Request Success!\nResponse:\n" .. response.content)
else
  gg.alert("❌ Request Failed.")
end
