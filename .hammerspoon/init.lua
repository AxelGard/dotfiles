hs = hs 

hs.hotkey.bind({"cmd"}, "1", function()
    hs.application.launchOrFocus("Brave Browser")
end)

hs.hotkey.bind({"cmd"}, "2", function()
    hs.application.launchOrFocusByBundleID("com.googlecode.iterm2")
end)

hs.hotkey.bind({"cmd"}, "3", function()
    hs.application.launchOrFocusByBundleID("com.microsoft.VSCode")

end)

hs.hotkey.bind({"cmd","alt"}, "0", function()
    print(hs.application.frontmostApplication():name())
end)


-- Move current window to left half of screen
hs.hotkey.bind({"cmd"}, "Left", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h
    win:setFrame(f)
end)

-- Move current window to right half of screen
hs.hotkey.bind({"cmd"}, "Right", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + (max.w / 2)
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h
    win:setFrame(f)
end)

