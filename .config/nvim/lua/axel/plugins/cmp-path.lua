local cmp = require("cmp")
cmp.setup {
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        {
        name = 'path',
        option = {
            pathMappings = {
                ['@'] = '${folder}/src',
                -- ['/'] = '${folder}/src/public/',
                -- ['~@'] = '${folder}/src',
                -- ['/images'] = '${folder}/src/images',
                -- ['/components'] = '${folder}/src/components',
            },
        },
        },
        { name = 'buffer' },
        { name = 'luasnip' },
    }),
}
