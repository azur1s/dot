require("config.lazy")
require("settings")
require("binds")
require("lsp")

local count = 0
for _ in pairs(require("lazy").plugins()) do count = count + 1 end

print(count .. " plugins loaded")
