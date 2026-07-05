# Chat Height Expander

Chat Height Expander is a World of Warcraft: The Burning Crusade Classic addon that adds a small button to the main chat window for toggling between compact and expanded chat heights.

## Features

- Toggle the main chat between compact and expanded heights.
- Small configurable `+`/`-` button anchored to each chat frame/tab.
- Expanded chat is temporarily raised above other UI panels, then restored when compacted.
- Options panel in the game's AddOns options screen.
- Standalone options window with `/che config`.
- Saves compact height, expanded height, button visibility, and button position.
- Creates optional macros for toggling the chat and opening options.
- English and Brazilian Portuguese localization based on the game client locale.

## Commands

```text
/che
/che config
/che compacta 160
/che expandida 360
/che botao
/che reset
```

English aliases are also available:

```text
/chatheight
/che collapsed 160
/che expanded 360
/che button
```

## Installation

Download `ChatHeightExpander.zip` from the latest GitHub Release and extract it into:

```text
World of Warcraft/_anniversary_/Interface/AddOns/
```

After extraction, the addon folder should be:

```text
World of Warcraft/_anniversary_/Interface/AddOns/ChatHeightExpander/
```

Restart the game or reload the UI with:

```text
/reload
```

Do not use GitHub's green **Code > Download ZIP** button for installation. That downloads the source repository snapshot, not the packaged addon.

## Usage

- Click the small `+` button on any chat frame/tab to expand the chat.
- Click the `-` button to return to compact height.
- Open the game options, go to the AddOns section, and select Chat Height Expander to configure heights and button position.
- Use `/che config` to open the standalone options window.
- Use the Create Macros button to create `CHE Toggle` and `CHE Options` macros automatically.

## Compatibility

Built for WoW TBC Classic Anniversary client:

```text
Interface: 20505
```
