# CurseForge Text

## Summary

Toggle compact and expanded chat in TBC Classic and WoW Forever, with a repositionable button and customizable heights.

## Description

**Chat Height Expander** adds a small `+` / `-` button to your chat windows so you can quickly switch between a compact chat and an expanded reading view.

Keep the chat small during normal gameplay and expand it whenever you want to read more messages. **Version 1.4.0 supports both The Burning Crusade Classic Anniversary and WoW Forever in the same download.**

## Features

- Toggle all standard chat windows between compact and expanded heights.
- Configure the compact and expanded heights to suit your layout.
- Show or hide the small `+` / `-` buttons.
- Choose any of the four corners for the buttons.
- Place buttons inside the chat or just outside its left/right edge.
- Fine-tune horizontal and vertical offsets to avoid other addons' chat icons.
- Expanded chat is temporarily raised above other UI panels, then restored when compacted.
- Configure the addon in the game's AddOns options or with `/che config`.
- Save your heights and button preferences between sessions.
- Create optional macros for quick access.
- Localization for all WoW client languages.

## What's new in 1.4.0

- WoW Forever support alongside TBC Classic Anniversary.
- Inside/outside button placement and horizontal/vertical offsets.
- Updated options windows with the new placement controls.

## Position the button around other chat icons

Open `/che config`, choose a corner, and enable **Place button outside chat** if you want the button beyond the chat's left or right edge. Leave it unchecked to keep the button inside the chat.

For finer placement, change **Horizontal offset** and **Vertical offset**, then click **Apply**. Positive values move right/up; negative values move left/down. Offsets accept -500 to 500 UI units and are rounded to whole numbers.

The button follows the chat when it moves or changes height. Settings apply to all chat buttons and are saved between sessions. **Reset** restores all addon settings, including heights and button placement.

## Commands

- `/che` - Toggle compact/expanded chat height.
- `/che config` - Open the options window.
- `/chatheight` - Alternative to `/che`.
- `/che collapsed 160` - Set compact height.
- `/che expanded 360` - Set expanded height.
- `/che button` - Show or hide the chat buttons.
- `/che reset` - Restore all default settings.

Portuguese aliases: `/che compacta 160`, `/che expandida 360`, `/che botao`, and `/che opcoes`.

## Compatibility

Tested in-game by the author on:

- **The Burning Crusade Classic Anniversary 2.5.6** - Interface 20506.
- **WoW Forever 1.60.1** - Interface 16001.

Install the same addon in either client's AddOns folder, or select the corresponding game installation in the CurseForge app.

## Notes

In Forever, Edit Mode can reapply its own height to the main chat window. Use `/che` to apply the addon's height again after editing the layout.

Chat Height Expander adjusts the size and layering of the standard WoW chat frames. Your messages, channels, and chat history are handled by the game as usual.
