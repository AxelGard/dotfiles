local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
	ensure_installed =  { "c", "lua", "vim", "vimdoc", "query", "python", "cpp" }, -- one of "all" or a list of languages
	ignore_install = { "" }, -- List of parsers to ignore installing
    auto_install = true,

	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "css" }, -- list of language that will be disabled
	},
	autopairs = {
		enable = true,
	},
    rainbow = {
        enable = false,
        colors = {
          -- Colors here
          
        },
    },
	indent = { enable = true, disable = { "python", "css" } },
})
