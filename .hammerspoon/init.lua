local hs = hs

local terminal = "com.mitchellh.ghostty" -- "com.googlecode.iterm2"
local browser = "Brave Browser"

hs.hotkey.bind({"cmd"}, "1", function()
    hs.application.launchOrFocus(browser)
end)

hs.hotkey.bind({"cmd"}, "2", function()
    hs.application.launchOrFocusByBundleID(terminal)
end)

hs.hotkey.bind({"cmd"}, "3", function()
    hs.application.launchOrFocusByBundleID("com.microsoft.VSCode")

end)

hs.hotkey.bind({"cmd","alt"}, "0", function()
    print(hs.application.frontmostApplication():name())
end)

hs.hotkey.bind({"cmd", "alt"}, "t", function()
    hs.application.launchOrFocusByBundleID(terminal)
end)

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


local previousFrames = {}

hs.hotkey.bind({"cmd"}, "Up", function()
    local win = hs.window.focusedWindow()
    if not win then return end

    local id = win:id()
    local maxFrame = win:screen():frame()

    if previousFrames[id] then
        win:setFrame(previousFrames[id])
        previousFrames[id] = nil
    else
        previousFrames[id] = win:frame()
        win:setFrame(maxFrame)
    end
end)

hs.hotkey.bind({"cmd"}, "Down", function()
    local win = hs.window.focusedWindow()
    if win then
        win:minimize()
        previousFrames[win:id()] = nil
    end
end)


hs.hotkey.bind({"cmd", "alt"}, "C", function()
    local win = hs.window.focusedWindow()
    if not win then return end

    local screen = win:screen()
    local max = screen:frame()
    local newFrame = {
        x = max.x + (max.w / 4),
        y = 40,
        w = max.w / 2,
        h = max.h - 30
    }

    win:setFrame(newFrame)
end)
