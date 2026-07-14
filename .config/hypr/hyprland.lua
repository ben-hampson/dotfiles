-- Reference conversion from the old hyprlang config.
-- Not currently sourced because Hyprland 0.55 on this machine produced
-- recursive parser errors when loading Lua via `source` from hyprland.conf.

local home = os.getenv("HOME")
local terminal = "alacritty"
local fileManager = "nautilus --new-window"
local menu = "rofi -show drun -theme " .. home .. "/.config/rofi/launchers/type-1/style-5.rasi"
local mainMod = "SUPER"

-- Binds first
hl.bind(mainMod .. " + 1", hl.dsp.focus({ workspace = 1 }))
hl.bind(mainMod .. " + 2", hl.dsp.focus({ workspace = 2 }))
hl.bind(mainMod .. " + 3", hl.dsp.focus({ workspace = 3 }))
hl.bind(mainMod .. " + 4", hl.dsp.focus({ workspace = 4 }))
hl.bind(mainMod .. " + 5", hl.dsp.focus({ workspace = 5 }))
hl.bind(mainMod .. " + 6", hl.dsp.focus({ workspace = 6 }))
hl.bind(mainMod .. " + 7", hl.dsp.focus({ workspace = 7 }))
hl.bind(mainMod .. " + 8", hl.dsp.focus({ workspace = 8 }))
hl.bind(mainMod .. " + 9", hl.dsp.focus({ workspace = 9 }))
hl.bind(mainMod .. " + 0", hl.dsp.focus({ workspace = 10 }))

hl.monitor({
  output = "eDP-1",
  mode = "3840x2400@60",
  position = "auto-center-left",
  scale = 2,
})

hl.monitor({
  output = "DP-6",
  mode = "3440x1440@59.97300",
  position = "auto",
  scale = 1,
})

hl.bind("switch:off:Lid Switch", hl.dsp.exec_cmd(home .. "/.config/hypr/lid.sh"), { locked = true })
hl.bind("switch:on:Lid Switch", hl.dsp.exec_cmd(home .. "/.config/hypr/lid.sh"), { locked = true })

hl.on("hyprland.start", function()
  hl.exec_cmd(home .. "/.config/hypr/lid.sh")
  hl.exec_cmd("waybar")
  hl.exec_cmd("hyprpaper")
  hl.exec_cmd("wl-paste --watch cliphist store")
  hl.dispatch(hl.dsp.exec_cmd("sleep 10 && " .. home .. "/.config/hypr/hyprland-open-and-move-to-workspace.sh slack Slack 2 >> " .. home .. "/log/slack-log.txt 2>&1", { workspace = "2 silent" }))
  hl.dispatch(hl.dsp.exec_cmd(terminal, { workspace = "3 silent" }))
  hl.dispatch(hl.dsp.exec_cmd("sleep 30 && microsoft-edge-stable", { workspace = "3 silent" }))
  hl.dispatch(hl.dsp.exec_cmd("firefox", { workspace = "9 silent" }))
  hl.exec_cmd("hypridle")
end)

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("AQ_DRM_DEVICES", "/dev/dri/card1:/dev/dri/card0")
hl.env("LIBVA_DRIVER_NAME", "iHD")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("NVD_BACKEND", "direct")
hl.env("GBM_BACKEND", "nvidia-drm")
hl.env("MOZ_ENABLE_WAYLAND", "1")
hl.env("__GL_MaxFramesAllowed", "1")
hl.env("__GL_VRR_ALLOWED", "0")
hl.env("__VK_LAYER_NV_optimus", "NVIDIA_only")
hl.env("VDPAU_DRIVER", "nvidia")

hl.config({
  general = {
    gaps_in = 2,
    gaps_out = 2,
    border_size = 1,
    col = {
      active_border = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
      inactive_border = "rgba(595959aa)",
    },
    resize_on_border = true,
    allow_tearing = true,
    layout = "dwindle",
  },
  decoration = {
    rounding = 3,
    active_opacity = 1,
    inactive_opacity = 1,
    shadow = {
      enabled = true,
      range = 2,
      render_power = 3,
      color = "rgba(1a1a1aee)",
    },
    blur = {
      enabled = true,
      size = 3,
      passes = 1,
      vibrancy = 0.1696,
    },
  },
  animations = {
    enabled = false,
  },
  dwindle = {
    preserve_split = true,
  },
  master = {
    new_status = "master",
  },
  misc = {
    force_default_wallpaper = 1,
    disable_hyprland_logo = true,
  },
  input = {
    kb_layout = "no",
    kb_options = "grp:win_space_toggle",
    kb_variant = "",
    kb_model = "",
    kb_rules = "",
    repeat_rate = 70,
    repeat_delay = 200,
    follow_mouse = 1,
    sensitivity = 0,
    touchpad = {
      natural_scroll = true,
    },
  },
  cursor = {
    no_hardware_cursors = true,
  },
})

hl.bind(mainMod .. " + SHIFT + L", hl.dsp.exec_cmd("pactl set-sink-mute @DEFAULT_SINK@ 1 && hyprlock --immediate-render"))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("cliphist list | rofi -theme " .. home .. "/.config/rofi/launchers/type-1/style-5.rasi -dmenu | cliphist decode | wl-copy"))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + M", hl.dsp.exit())
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + F", hl.dsp.window.float())
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + A", hl.dsp.exec_cmd("microsoft-edge-stable"))
hl.bind(mainMod .. " + O", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + U", hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + I", hl.dsp.layout("swapsplit"))
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.exec_cmd("hyprshot -m window"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("hyprshot -m output"))
hl.bind(mainMod .. " + SHIFT + R", hl.dsp.exec_cmd("hyprshot -m region"))
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd("swaync-client -t -sw"))
hl.bind(mainMod .. " + h", hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "r" }))
hl.bind(mainMod .. " + k", hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + j", hl.dsp.focus({ direction = "d" }))

hl.bind(mainMod .. " + SHIFT + 1", hl.dsp.window.move({ workspace = 1 }))
hl.bind(mainMod .. " + SHIFT + 2", hl.dsp.window.move({ workspace = 2 }))
hl.bind(mainMod .. " + SHIFT + 3", hl.dsp.window.move({ workspace = 3 }))
hl.bind(mainMod .. " + SHIFT + 4", hl.dsp.window.move({ workspace = 4 }))
hl.bind(mainMod .. " + SHIFT + 5", hl.dsp.window.move({ workspace = 5 }))
hl.bind(mainMod .. " + SHIFT + 6", hl.dsp.window.move({ workspace = 6 }))
hl.bind(mainMod .. " + SHIFT + 7", hl.dsp.window.move({ workspace = 7 }))
hl.bind(mainMod .. " + SHIFT + 8", hl.dsp.window.move({ workspace = 8 }))
hl.bind(mainMod .. " + SHIFT + 9", hl.dsp.window.move({ workspace = 9 }))
hl.bind(mainMod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = 10 }))

hl.bind(mainMod .. " + SHIFT + CTRL + 1", hl.dsp.workspace.move({ monitor = "+1" }))
hl.bind(mainMod .. " + SHIFT + CTRL + 2", hl.dsp.workspace.move({ monitor = "-1" }))

hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s 10%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 10%-"), { locked = true, repeating = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

hl.window_rule({
  name = "ignore-maximize",
  match = { class = ".*" },
  suppress_event = "maximize",
})

hl.window_rule({
  name = "xwayland-drag-fix",
  match = { class = "^$", title = "^$", xwayland = true, float = true, fullscreen = false, pin = false },
  no_focus = true,
})

hl.window_rule({
  name = "intune",
  match = { class = "Intune-portal" },
  float = true,
  center = true,
})

hl.window_rule({
  name = "nautilus-float",
  match = { initial_class = "org.gnome.Nautilus" },
  float = true,
})

hl.window_rule({
  name = "nautilus-size",
  match = { initial_class = "org.gnome.Nautilus" },
  size = { 1000, 600 },
})

hl.window_rule({
  name = "anki-float",
  match = { initial_class = "Anki" },
  float = true,
})

hl.window_rule({
  name = "anki-size",
  match = { initial_class = "Anki" },
  size = { 800, 600 },
})

hl.window_rule({
  name = "solanum-float",
  match = { initial_class = "Solanum" },
  float = true,
})

hl.window_rule({
  name = "solanum-size",
  match = { initial_class = "Solanum" },
  size = { 400, 300 },
})

hl.window_rule({
  name = "solanum-center",
  match = { initial_class = "Solanum" },
  center = true,
})

hl.window_rule({
  name = "calc-float",
  match = { initial_class = "org.gnome.Calculator" },
  float = true,
})

hl.window_rule({
  name = "drawing-float",
  match = { initial_class = "com.github.maoschanz.drawing" },
  float = true,
})

hl.window_rule({
  name = "xdp-gtk-float",
  match = { initial_class = "xdg-desktop-portal-gtk" },
  float = true,
  size = { 1000, 750 },
  no_shadow = false,
})

hl.window_rule({
  name = "pavu-float",
  match = { initial_class = "org.pulseaudio.pavucontrol" },
  size = { 800, 600 },
  float = true,
})

hl.window_rule({
  name = "blueman-float",
  match = { initial_class = "blueman-manager" },
  size = { 800, 600 },
  float = true,
})

hl.window_rule({
  name = "teams-tile",
  match = { initial_title = "Microsoft Teams" },
  tile = true,
})

hl.window_rule({
  name = "outlook-tile",
  match = { initial_title = "Outlook.*" },
  tile = true,
})

hl.window_rule({
  name = "edge-tempfix",
  match = { class = "^()$", title = "^()$", initial_class = "^()$", initial_title = "^()$" },
  no_initial_focus = true,
  float = true,
  move = { "cursor_x", "cursor_y" },
  no_blur = true,
})
