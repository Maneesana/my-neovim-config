return {
    {
    -- Hellps with ssh tunneling and copying
	'ojroques/vim-oscyank',
    },
    {
	-- Git Plugin
	'tpope/vim-fugitive',
    },
    {
	-- show CSS Colors
	'brenoprata10/nvim-highlight-colors',
	config = function()
	    require('nvim-highlight-colors').setup({})
	end
    }

}
