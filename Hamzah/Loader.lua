local MD5 = gg.makeRequest('').content
function Main()
menu = gg.choice({
'⚔Battle Arena Mod⚔',
'🏟Recall Dragon🏟',
'⚔Rescue⚔',
'🆘Help',
'🔵Exit🔵'
},nil, 'Dragon City Tools\nScript Made By Dungg')
if menu == 1 then DragonCityHack1() end
if menu == 2 then DragonCityHack2() end
if menu == 3 then DragonCityHack3() end
if menu == 4 then DragonCityHack4() end
if menu == 5 then DragonCityHack5() end
if menu ==nil then NoSelect() end
end
function DragonCityHack1()
L = gg.makeRequest('https://raw.githubusercontent.com/DunggKR/SaveData/main/Hamzah/Arena.lua').content
if not L then gg.alert('SERVER: Allow Internet Connection...') else
pcall(load(L)) end
end

function DragonCityHack2()
L = gg.makeRequest('https://raw.githubusercontent.com/DunggKR/SaveData/main/Hamzah/Recall.lua').content
if not L then gg.alert('SERVER: Allow Internet Connection...') else
pcall(load(L)) end
end

function DragonCityHack3()
L = gg.makeRequest('https://raw.githubusercontent.com/DunggKR/SaveData/main/Hamzah/Rescue.lua').content
if not L then gg.alert('SERVER: Allow Internet Connection...') else
pcall(load(L)) end
end

function DragonCityHack4()
L = gg.makeRequest('https://dunggkr.github.io/DC-Script/Help.lua').content
if not L then gg.alert('SERVER: Allow Internet Connection...') else
pcall(load(L)) end
end

function DragonCityHack5()
os.exit()
end

function NoSelect()
gg.sleep(100)
gg.toast('Script Made By Dungg')
end

-------------------------------------------------------------------------
gg.setVisible(true)
while true do
if gg.isVisible() then
gg.setVisible(false)
Main() end end
-------------------------------------------------------------------------
