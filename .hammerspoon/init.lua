
hs = hs 

hs.hotkey.bind({"cmd","alt"}, "1", function()
    hs.application.launchOrFocusByBundleID("com.googlecode.iterm2")
end)

hs.hotkey.bind({"cmd","alt"}, "2", function()
    hs.application.launchOrFocus("Brave Browser")
end)

hs.hotkey.bind({"cmd","alt"}, "3", function()
    hs.application.launchOrFocusByBundleID("com.microsoft.VSCode")

end)

hs.hotkey.bind({"cmd","alt"}, "0", function()
    print(hs.application.frontmostApplication():name())
end)



