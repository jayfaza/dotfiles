local home   = os.getenv("HOME")
local hypr   = home .. "/.config/hypr"
package.path = package.path .. ";" .. home .. "/.config/caelestia/?.lua"

-- Create a file if it doesn't exist, optionally with initial content
local function maybe_create(file, content)
    local f = io.open(file)

    if f then
        f:close()
        return
    end

    f = io.open(file, "w")
    if f then
        if content then f:write(content) end
        f:close()
    end
end

-- Copy src to dst, but only if dst doesn't already exist
local function maybe_copy(src, dst)
    local out = io.open(dst)
    if out then
        out:close()
        return
    end

    local input = io.open(src, "r")
    if not input then return end

    out = io.open(dst, "w")
    if out then
        out:write(input:read("*a"))
        out:close()
    end
    input:close()
end

-- Maybe set current colours to defaults
maybe_copy(hypr .. "/scheme/default.lua", hypr .. "/scheme/current.lua")

-- User variables
maybe_create(home .. "/.config/caelestia/hypr-vars.lua", "return {}\n")
local overrides = require("hypr-vars")
if type(overrides) == "table" then
    local vars = require("variables")
    for k, v in pairs(overrides) do
        vars[k] = v
    end
end

-- Default monitor conf
hl.monitor({
    output   = "HDMI-A-1",
    mode     = "1920x1080@240",
    position = "auto",
    scale    = 1,
})

-- Configs
require("hyprland.env")
require("hyprland.general")
require("hyprland.input")
require("hyprland.misc")
require("hyprland.animations")
require("hyprland.decoration")
require("hyprland.group")
require("hyprland.execs")
require("hyprland.rules")
require("hyprland.gestures")
require("hyprland.keybinds")



-- User configs
maybe_create(home .. "/.config/caelestia/hypr-user.lua")
require("hypr-user")

-- HyprMod managed settings
require("hyprland-gui")
-- Проверяем, загружен ли плагин
if hl.plugin.hyprglass then
    local hg = hl.plugin.hyprglass

    -- Глобальные настройки
    hg.config({
        default_theme = "dark",          -- или "light"
        default_preset = "glass",        -- glass, subtle, clear, high_contrast
        tint_color = 0x8899aa22,         -- оттенок стекла (RRGGBBAA)
        brightness = 0.8,
        
        -- Настройки для тёмной темы
        dark = { 
            brightness = 0.82,
            contrast = 0.90,
            saturation = 0.80,
            adaptive_dim = 0.4
        },
        
        -- Настройки для светлой темы
        light = { 
            brightness = 1.12,
            contrast = 0.92,
            saturation = 0.85,
            adaptive_boost = 0.4
        },

        -- Включаем эффект для слоёв (панели, виджеты)
        layers = { enabled = true }
    })

    -- Настройка слоёв (для Waybar, панелей и т.д.)
    hg.layer("waybar", { preset = "glass", mask_threshold = 0.05 })
    hg.layer("swaync")  -- если используете уведомления
    hg.layer("caelestia-panel", { 
        preset = "apple_liquid_glass",  -- можно использовать тот же пресет
        mask_threshold = 0.05 
    })
    
    -- Лаунчер
    hg.layer("caelestia-launcher", { 
        preset = "apple_liquid_glass",
        mask_threshold = 0.05 
    })
    
    -- Док
    hg.layer("caelestia-dock", { 
        preset = "apple_liquid_glass",
        mask_threshold = 0.05 
    })

    -- Если есть уведомления Caelestia
    hg.layer("caelestia-notifications", { 
        preset = "subtle",  -- для уведомлений можно сделать более лёгкий эффект
        mask_threshold = 0.05 
    })
    -- hg.layer("wofi", { preset = "glass" })  -- если используете wofi
    
    -- Исключаем некоторые слои, если нужно
    -- hg.layer("debug-panel", { exclude = true })

    -- Создаём свой пользовательский пресет (опционально)
    hg.preset("my_glass", {
        glass_opacity = 0.85,
        blur_strength = 1,
        xray = false,
        blur_iterations = 2,
        refraction_strength = 8.0,
        chromatic_aberration = 0.5,
        fresnel_strength = 0.5,
        specular_strength = 0.7,
        edge_thickness = 0.08,
        tint_color = 0xffffff00,
        dark = { adaptive_dim = 0.3 },
        light = { adaptive_boost = 0.3 }
    })
    
    -- Теперь можно использовать свой пресет:
    -- default_preset = "my_glass"
else
    -- Если плагин не загружен, показываем предупреждение
    print("Hyprglass plugin not loaded! Check hyprpm status.")
end
