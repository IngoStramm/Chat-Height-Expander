# Chat Height Expander

![Chat Height Expander icon](assets/chat-height-expander-icon.png)

Chat Height Expander adds a small `+` / `-` button to the World of Warcraft chat so you can switch between a compact view and an expanded reading view. Version **1.4.0** supports **The Burning Crusade Classic Anniversary** and **WoW Forever** in one package.

## Features

- Toggle all standard chat windows between configurable compact and expanded heights.
- A small `+` / `-` button on each chat window.
- Choose any of the four corners and place the button inside the chat or outside its left/right edge.
- Adjust horizontal and vertical offsets to avoid other addons' chat icons.
- Expanded chat is temporarily raised above other UI panels, then restored when compacted.
- Configure the addon through the game's AddOns options or the standalone `/che config` window.
- Save heights, button visibility, corner, inside/outside placement, and offsets between sessions.
- Create optional macros for toggling the chat and opening options.
- Localization for enUS, enGB, ptBR, deDE, esES, esMX, frFR, itIT, koKR, ruRU, zhCN, and zhTW.

## Installation

Install **Chat Height Expander** from [CurseForge](https://www.curseforge.com/wow/addons/chat-height-expander), selecting your TBC Classic or Forever installation in the CurseForge app.

For a manual installation, download `ChatHeightExpander.zip` from the [GitHub Releases](https://github.com/IngoStramm/Chat-Height-Expander/releases) and extract it into the appropriate AddOns directory:

| Client | AddOns directory |
| --- | --- |
| TBC Classic Anniversary | `World of Warcraft/_anniversary_/Interface/AddOns/` |
| WoW Forever | `World of Warcraft/_forever_/Interface/AddOns/` |

The resulting folder must be `AddOns/ChatHeightExpander/`, with `ChatHeightExpander.toc` and `ChatHeightExpander.lua` directly inside it. The same ZIP supports both clients.

Restart the game after a first installation. For an update to an existing installation, use `/reload` or restart the game.

GitHub's **Code > Download ZIP** downloads a source snapshot. Use the packaged ZIP from Releases for manual installation.

## Usage

Click `+` to expand the chat and `-` to return to the compact height. The `/che` command performs the same action.

Open `/che config` or select **Chat Height Expander** in the game's AddOns options to change heights and button placement.

To avoid another addon's chat icon:

1. Choose a corner under **Button position**.
2. Enable **Place button outside chat** to place the button just beyond the left or right edge of that corner. Leave it unchecked for placement inside the chat.
3. Adjust **Horizontal offset** and **Vertical offset**, then click **Apply**. Positive values move right/up; negative values move left/down. Offsets range from -500 to 500 UI units and are rounded to whole numbers.

The button follows the chat as it moves or changes height. Placement settings apply to all chat buttons and are saved between sessions. **Reset** restores all addon settings, including heights and button placement.

Use **Create Macros** to create `CHE Toggle` and `CHE Options` macros for toggling the chat and opening options.

## Commands

| Command | Action |
| --- | --- |
| `/che` | Toggle compact/expanded chat. |
| `/chatheight` | Alternative to `/che`. |
| `/che config` | Open options. |
| `/che collapsed 160` | Set the compact height. |
| `/che expanded 360` | Set the expanded height. |
| `/che button` | Show or hide the chat buttons. |
| `/che reset` | Restore all default settings. |

Portuguese aliases are also available: `/che compacta 160`, `/che expandida 360`, `/che botao`, and `/che opcoes`.

## Compatibility

Version 1.4.0 has been tested in-game by the author on both clients:

| Client | Game version | Interface |
| --- | --- | --- |
| TBC Classic Anniversary | 2.5.6 | 20506 |
| WoW Forever | 1.60.1 | 16001 |

Both clients use the same addon folder, code, and release package.

In Forever, Edit Mode can reapply its own height to the main chat window. Use `/che` to apply the addon's height again after editing the layout.

## Changelog

See [CHANGELOG.md](CHANGELOG.md) for the changes in version 1.4.0 and earlier releases.

## Development checks

From this directory, run `lua scripts/test-button-position.lua` using Lua 5.1. The checks simulate WoW frames to cover all eight placements, offset validation, existing saved settings, reload persistence, both option windows, toggle, and reset.

Visual appearance and interaction with other addons should also be checked in the game client.
