local options = {
	backup = false,
	clipboard = "unnamedplus",
	cmdheight = 2,
	mouse = "a",
	showtabline = 2,
	smartindent = true,
	smartcase = true,
	splitright = true,
    splitbelow = true,
	expandtab = true,
	tabstop = 4,
	shiftwidth = 4,
	cursorline = true,
	number = true,
	numberwidth = 4,
    signcolumn = "yes",
    undofile = true,
    scrolloff = 8,
    sidescrolloff = 8,
    termguicolors = true,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

