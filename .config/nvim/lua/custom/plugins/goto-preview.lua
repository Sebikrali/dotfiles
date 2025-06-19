-- Keybinds
-- gpd - Preview definition
-- gpt - Preview type definition
-- gpi - Preview implementation
-- gpD - Preview declaration
-- gP  - Close all windows
-- gpr - Preview references
return {
    'rmagatti/goto-preview',
    opts = {
        width = 120, -- Width of the floating window
        height = 40, -- Height of the floating window
        default_mappings = true, -- Bind default mappings
        opacity = 0, -- 0-100 opacity level of the floating window where 100 is fully transparent.
        resizing_mappings = true, -- Binds arrow keys to resizing the floating window.
    },
}
