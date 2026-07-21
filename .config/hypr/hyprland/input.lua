local vars = require("variables")

hl.config({
    input = {
        kb_layout          = "us, ru",
        kb_options        = "grp:caps_toggle",
        numlock_by_default = false,
        force_no_accel     = true,
        repeat_delay       = 200,
        repeat_rate        = 30,
        focus_on_close     = 1,
        sensitivity = 0,

        touchpad           = {
            natural_scroll       = true,
            disable_while_typing = vars.touchpadDisableTyping,
            scroll_factor        = vars.touchpadScrollFactor,
        },
    },

    binds = {
        scroll_event_delay = 0,
    },

    cursor = {
        hotspot_padding = 1,
    },
})
