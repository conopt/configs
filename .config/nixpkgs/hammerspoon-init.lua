hs.hotkey.bind({"ctrl"}, "=", function()
  local win = hs.window.focusedWindow()
  --win:setTopLeft(hs.geometry.point(0, 0))
  --win:maximize(0)
  local screen = win:screen()
  local full_frame = screen:fullFrame()
  win:setFrame(hs.geometry.rect(full_frame.x, full_frame.y, full_frame.w, win:screen():frame().h), 0)
end)
--
hs.hotkey.bind({"ctrl", "cmd"}, "l", function()
  lockscreen.lockscreen()
end)

-- bind hotkey
hs.hotkey.bind({"ctrl", "cmd"}, "o", function()
  -- get the focused window
  local win = hs.window.focusedWindow()
  -- get the screen where the focused window is displayed, a.k.a. current screen
  local screen = win:screen()
  -- compute the unitRect of the focused window relative to the current screen
  -- and move the window to the next screen setting the same unitRect 
  win:move(win:frame():toUnitRect(screen:frame()), screen:next(), true, 0)
end)

--hotkey.bind({"cmd"},"e",hints.windowHints)

--hotkey.bind({"cmd", "shift"}, "N", function()
--  window
--end)

--hotkey.bind({"cmd", "alt", "ctrl"}, "D", function()
--  local win = window.focusedwindow()
--  local f = win:frame()
--  f.x = f.x + 10
--  win:setframe(f)
--end)

