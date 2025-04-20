-- add this to your lua/plugins.lua, lua/plugins/init.lua,  or the file you keep your other plugins:
return {
    'numToStr/Comment.nvim',
    opts = {
        ---LHS of toggle mappings in NORMAL mode
        toggler = {
            ---Line-comment toggle keymap
            line = '<leader>cc',
            ---Block-comment toggle keymap
            block = '<leader>bc',
        },
        ---LHS of operator-pending mappings in NORMAL and VISUAL mode
        opleader = {
            ---Line-comment keymap
            line = '<leader>c',
            ---Block-comment keymap
            -- block = '<leader>b',
            block = nil,
        },
        ---LHS of extra mappings
        extra = {
            ---Add comment at the end of line
            eol = '<leader>ca',
        },
    }
}
