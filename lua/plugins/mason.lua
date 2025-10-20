return {
	{
		'mason-org/mason.nvim',
		lazy = false,
		config = true
	},
	{
		'WhoIsSethDaniel/mason-tool-installer.nvim',
		lazy = false,
		dependencies = {
			"mason-org/mason.nvim"
		},
		config = function()
			require('mason-lspconfig').setup {
				ensure_installed = {
				},
				automatic_enable = true,
			}
			require('mason-tool-installer').setup {
				-- a list of all tools you want to ensure are installed upon
				-- start
				ensure_installed = {

					-- Vum/Lua
					"lua_ls",
					"selene",

					-- Kube
					'helm_ls',

					-- Protobufs
					"buf_ls",

					-- Ansible
					{ 'ansible-lint', condition = function()
						return vim.fn.executable('python') == 1 and
							vim.fn.executable('ansible')
					end },
					{ 'ansiblels', condition = function()
						return vim.fn.executable('node') == 1 and
							vim.fn.executable('ansible')
					end },

					-- Scripting
					"shellcheck",
					{ 'bashls',        condition = function() return vim.fn.executable('node') == 1 end },

					-- Go
					{ 'delve',         condition = function() return vim.fn.executable('go') == 1 end },
					{ 'gopls',         condition = function() return vim.fn.executable('go') == 1 end },
					{ 'golangci-lint', condition = function() return vim.fn.executable('go') == 1 end },

					-- Config Languages
					--
					{ 'jsonls',        condition = function() return vim.fn.executable('node') == 1 end },
					{ 'yamlls',        condition = function() return vim.fn.executable('node') == 1 end },
					{ 'html',          condition = function() return vim.fn.executable('node') == 1 end },
					"lemminx", -- xml
					{ 'hyprls',      condition = function() return vim.fn.executable('hyprctl') == 1 end },

					-- JS/TS
					{ 'ts_ls',       condition = function() return vim.fn.executable('node') == 1 end },

					-- Terraform
					{ 'tflint',      condition = function() return vim.fn.executable('terraform') == 1 end },
					{ 'tfsec',       condition = function() return vim.fn.executable('terraform') == 1 end },
					{ 'terraformls', condition = function() return vim.fn.executable('terraform') == 1 end },
				},

				-- if set to true this will check each tool for updates. If updates
				-- are available the tool will be updated. This setting does not
				-- affect :MasonToolsUpdate or :MasonToolsInstall.
				-- Default: false
				auto_update = true,

				-- automatically install / update on startup. If set to false nothing
				-- will happen on startup. You can use :MasonToolsInstall or
				-- :MasonToolsUpdate to install tools and check for updates.
				-- Default: true
				run_on_start = true,

				-- set a delay (in ms) before the installation starts. This is only
				-- effective if run_on_start is set to true.
				-- e.g.: 5000 = 5 second delay, 10000 = 10 second delay, etc...
				-- Default: 0
				start_delay = 3000, -- 3 second delay

				-- Only attempt to install if 'debounce_hours' number of hours has
				-- elapsed since the last time Neovim was started. This stores a
				-- timestamp in a file named stdpath('data')/mason-tool-installer-debounce.
				-- This is only relevant when you are using 'run_on_start'. It has no
				-- effect when running manually via ':MasonToolsInstall' etc....
				-- Default: nil
				debounce_hours = 5, -- at least 5 hours between attempts to install/update
			}
		end
	},
}
