fin_busc = 1
gg.setRanges(gg.REGION_C_ALLOC | gg.REGION_ANONYMOUS)
gg.refineNumber("9288798", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)

while true do
  if gg.isVisible(true) then
    menuk = 1
    menuk2 = 2
    gg.setVisible(false)
  end

  START = 1

  function START()
    menu = gg.choice({
      'Win',
      'Defeat',
      '❎ Exit ❎'
    }, Last, 'Script Battle Made By Dungg')

    if menu == 1 then
      lvl = 1
      idt = 1011
      find_ones()
    elseif menu == 2 then
      lvl = 500
      idt = 3011
      find_ones()
    elseif menu == 3 then
      run_exit_script() -- 👈 Calls your GitHub loader
    elseif menu == nil then
      noselect()
    end
    menuk = -1
  end

  function find_ones()
    if fin_busc == 0 then
      menuk = -1
      change_yisus()
    else
      local input1 = gg.prompt(
        {"1st Dragon Level", "2nd Dragon Level", "1st Dragon Star", "2nd Dragon Star"},
        {nil, nil, nil, nil},
        {'number', 'number', 'number', 'number'}
      )
      if input1 == nil then
        menuk = -1
        START()
      else
        gg.clearResults()
        gg.searchNumber("1000~5600;"..input1[1]..";"..input1[3]..";1000~5600;"..input1[2]..";"..input1[4].."::133", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
        gg.refineNumber("1000~5600;"..input1[1]..";"..input1[3]..";1000~5600;"..input1[2].."::101", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
        gg.refineNumber("1000~5600;"..input1[1]..";"..input1[3]..";1000~5600::97", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
        gg.refineNumber("1000~5600;"..input1[1]..";"..input1[3].."::37", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
        gg.refineNumber("1000~5600;"..input1[1].."::5", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
        point = gg.getResults(10)
        gg.addListItems(point)
        gg.clearResults()
        fin_busc = 0
        change_yisus()
      end
    end
  end

  function change_yisus()
    gg.setValues({
      {address = point[1].address + 0x0,  flags = 4, value = 1011},
      {address = point[1].address + 0x4,  flags = 4, value = 1},
      {address = point[1].address + 0x60, flags = 4, value = 1011},
      {address = point[1].address + 0x64, flags = 4, value = 1},
      {address = point[1].address + 0xC0, flags = 4, value = idt},
      {address = point[1].address + 0xC4, flags = 4, value = lvl}
    })
  end

  function noselect()
    gg.isVisible(true)
  end

  -- 👇 This is your EXIT handler that loads external Lua
  function run_exit_script()
    local L = gg.makeRequest('https://raw.githubusercontent.com/DunggKR/SaveData/main/Hamzah/Loader.lua').content
    if not L or L == '' then
      gg.alert('SERVER: Allow Internet Connection...')
    else
      local f = load(L)
      if f then
        pcall(f)
      else
        gg.alert('SERVER: Invalid script content')
      end
    end
  end

  if menuk == 1 then START() end
end
