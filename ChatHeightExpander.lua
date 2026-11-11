local ADDON_NAME = ...
local LOCALE = GetLocale and GetLocale() or "enUS"

local LOCALES = {
    enUS = {
        ADDON_NAME = "Chat Height Expander",
        TITLE = "Chat Height Expander",
        CONFIG_TITLE = "Chat Height Expander - Options",
        OPTIONS_PANEL_HINT = "These settings also affect the small chat button and /che command.",
        COLLAPSED_HEIGHT = "Compact height",
        EXPANDED_HEIGHT = "Expanded height",
        SHOW_BUTTON = "Show chat button",
        BUTTON_POSITION = "Button position",
        BUTTON_OUTSIDE = "Place button outside chat",
        BUTTON_OFFSET_X = "Horizontal offset",
        BUTTON_OFFSET_Y = "Vertical offset",
        BUTTON_OFFSET_HINT = "Positive: right / up. Negative: left / down. Range: -500 to 500.",
        INVALID_OFFSET = "Use offsets between -500 and 500.",
        TOPRIGHT = "Top right",
        TOPLEFT = "Top left",
        BOTTOMRIGHT = "Bottom right",
        BOTTOMLEFT = "Bottom left",
        APPLY = "Apply",
        USE_CURRENT = "Use Current as Compact",
        RESET = "Reset",
        CREATE_MACROS = "Create Macros",
        CLOSE = "Close",
        EXPAND_TOOLTIP = "Click to expand the chat.",
        COLLAPSE_TOOLTIP = "Click to compact the chat.",
        INVALID_HEIGHT = "Use a number greater than or equal to 60.",
        HEIGHT_SAVED = "Height saved:",
        BUTTON_VISIBLE = "Button visible.",
        BUTTON_HIDDEN = "Button hidden. Use /che button or /che config to show it again.",
        CONFIG_RESET = "Settings reset.",
        CONFIG_APPLIED = "Settings applied.",
        CURRENT_SAVED = "Current chat height saved as compact height.",
        MACROS_CREATED = "Macros created or updated.",
        MACRO_FULL = "There is no room to create a global macro. Create macros manually with: /che and /che config",
        HELP_TOGGLE = "/che - toggles compact/expanded chat.",
        HELP_CONFIG = "/che config - opens options.",
        HELP_COLLAPSED = "/che collapsed 160 - sets compact height.",
        HELP_EXPANDED = "/che expanded 360 - sets expanded height.",
        HELP_BUTTON = "/che button - shows/hides the button.",
        HELP_RESET = "/che reset - restores defaults.",
    },
    ptBR = {
        ADDON_NAME = "Chat Height Expander",
        TITLE = "Chat Height Expander",
        CONFIG_TITLE = "Chat Height Expander - Opcoes",
        OPTIONS_PANEL_HINT = "Estas opcoes tambem afetam o botao pequeno do chat e o comando /che.",
        COLLAPSED_HEIGHT = "Altura compacta",
        EXPANDED_HEIGHT = "Altura expandida",
        SHOW_BUTTON = "Mostrar botao no chat",
        BUTTON_POSITION = "Posicao do botao",
        BUTTON_OUTSIDE = "Colocar botao fora do chat",
        BUTTON_OFFSET_X = "Deslocamento horizontal",
        BUTTON_OFFSET_Y = "Deslocamento vertical",
        BUTTON_OFFSET_HINT = "Positivo: direita / cima. Negativo: esquerda / baixo. Limite: -500 a 500.",
        INVALID_OFFSET = "Use deslocamentos entre -500 e 500.",
        TOPRIGHT = "Superior direita",
        TOPLEFT = "Superior esquerda",
        BOTTOMRIGHT = "Inferior direita",
        BOTTOMLEFT = "Inferior esquerda",
        APPLY = "Aplicar",
        USE_CURRENT = "Usar Altura Atual como Compacta",
        RESET = "Resetar",
        CREATE_MACROS = "Criar Macros",
        CLOSE = "Fechar",
        EXPAND_TOOLTIP = "Clique para expandir o chat.",
        COLLAPSE_TOOLTIP = "Clique para compactar o chat.",
        INVALID_HEIGHT = "Use um numero maior ou igual a 60.",
        HEIGHT_SAVED = "Altura salva:",
        BUTTON_VISIBLE = "Botao visivel.",
        BUTTON_HIDDEN = "Botao oculto. Use /che botao ou /che config para mostrar de novo.",
        CONFIG_RESET = "Configuracao restaurada.",
        CONFIG_APPLIED = "Configuracao aplicada.",
        CURRENT_SAVED = "Altura atual do chat salva como altura compacta.",
        MACROS_CREATED = "Macros criadas ou atualizadas.",
        MACRO_FULL = "Nao ha espaco para criar uma macro geral. Crie manualmente macros com: /che e /che config",
        HELP_TOGGLE = "/che - alterna entre compacto e expandido.",
        HELP_CONFIG = "/che config - abre as opcoes.",
        HELP_COLLAPSED = "/che compacta 160 - define a altura compacta.",
        HELP_EXPANDED = "/che expandida 360 - define a altura expandida.",
        HELP_BUTTON = "/che botao - mostra/oculta o botao.",
        HELP_RESET = "/che reset - volta para os valores padrao.",
    },
    deDE = {
        CONFIG_TITLE = "Chat Height Expander - Optionen",
        OPTIONS_PANEL_HINT = "Diese Einstellungen wirken sich auch auf die kleine Chat-Schaltfläche und den Befehl /che aus.",
        COLLAPSED_HEIGHT = "Kompakte Höhe",
        EXPANDED_HEIGHT = "Erweiterte Höhe",
        SHOW_BUTTON = "Chat-Schaltfläche anzeigen",
        BUTTON_POSITION = "Schaltflächenposition",
        BUTTON_OUTSIDE = "Schaltfläche außerhalb des Chats",
        BUTTON_OFFSET_X = "Horizontaler Versatz",
        BUTTON_OFFSET_Y = "Vertikaler Versatz",
        BUTTON_OFFSET_HINT = "Positiv: rechts / oben. Negativ: links / unten. Bereich: -500 bis 500.",
        INVALID_OFFSET = "Verwende einen Versatz zwischen -500 und 500.",
        TOPRIGHT = "Oben rechts",
        TOPLEFT = "Oben links",
        BOTTOMRIGHT = "Unten rechts",
        BOTTOMLEFT = "Unten links",
        APPLY = "Anwenden",
        USE_CURRENT = "Aktuelle Höhe als kompakt verwenden",
        RESET = "Zurücksetzen",
        CREATE_MACROS = "Makros erstellen",
        CLOSE = "Schließen",
        EXPAND_TOOLTIP = "Klicken, um den Chat zu erweitern.",
        COLLAPSE_TOOLTIP = "Klicken, um den Chat zu verkleinern.",
        INVALID_HEIGHT = "Verwende eine Zahl größer oder gleich 60.",
        HEIGHT_SAVED = "Höhe gespeichert:",
        BUTTON_VISIBLE = "Schaltfläche sichtbar.",
        BUTTON_HIDDEN = "Schaltfläche ausgeblendet. Verwende /che button oder /che config, um sie wieder anzuzeigen.",
        CONFIG_RESET = "Einstellungen zurückgesetzt.",
        CONFIG_APPLIED = "Einstellungen angewendet.",
        CURRENT_SAVED = "Aktuelle Chathöhe als kompakte Höhe gespeichert.",
        MACROS_CREATED = "Makros erstellt oder aktualisiert.",
        MACRO_FULL = "Es gibt keinen Platz für ein globales Makro. Erstelle Makros manuell mit: /che und /che config",
        HELP_TOGGLE = "/che - schaltet zwischen kompaktem und erweitertem Chat um.",
        HELP_CONFIG = "/che config - öffnet die Optionen.",
        HELP_COLLAPSED = "/che collapsed 160 - setzt die kompakte Höhe.",
        HELP_EXPANDED = "/che expanded 360 - setzt die erweiterte Höhe.",
        HELP_BUTTON = "/che button - zeigt/versteckt die Schaltfläche.",
        HELP_RESET = "/che reset - stellt die Standardwerte wieder her.",
    },
    esES = {
        CONFIG_TITLE = "Chat Height Expander - Opciones",
        OPTIONS_PANEL_HINT = "Estos ajustes también afectan al pequeño botón del chat y al comando /che.",
        COLLAPSED_HEIGHT = "Altura compacta",
        EXPANDED_HEIGHT = "Altura expandida",
        SHOW_BUTTON = "Mostrar botón del chat",
        BUTTON_POSITION = "Posición del botón",
        BUTTON_OUTSIDE = "Colocar el botón fuera del chat",
        BUTTON_OFFSET_X = "Desplazamiento horizontal",
        BUTTON_OFFSET_Y = "Desplazamiento vertical",
        BUTTON_OFFSET_HINT = "Positivo: derecha / arriba. Negativo: izquierda / abajo. Rango: -500 a 500.",
        INVALID_OFFSET = "Usa desplazamientos entre -500 y 500.",
        TOPRIGHT = "Arriba derecha",
        TOPLEFT = "Arriba izquierda",
        BOTTOMRIGHT = "Abajo derecha",
        BOTTOMLEFT = "Abajo izquierda",
        APPLY = "Aplicar",
        USE_CURRENT = "Usar altura actual como compacta",
        RESET = "Restablecer",
        CREATE_MACROS = "Crear macros",
        CLOSE = "Cerrar",
        EXPAND_TOOLTIP = "Haz clic para expandir el chat.",
        COLLAPSE_TOOLTIP = "Haz clic para compactar el chat.",
        INVALID_HEIGHT = "Usa un número mayor o igual que 60.",
        HEIGHT_SAVED = "Altura guardada:",
        BUTTON_VISIBLE = "Botón visible.",
        BUTTON_HIDDEN = "Botón oculto. Usa /che button o /che config para mostrarlo de nuevo.",
        CONFIG_RESET = "Configuración restablecida.",
        CONFIG_APPLIED = "Configuración aplicada.",
        CURRENT_SAVED = "Altura actual del chat guardada como altura compacta.",
        MACROS_CREATED = "Macros creadas o actualizadas.",
        MACRO_FULL = "No hay espacio para crear una macro global. Crea macros manualmente con: /che y /che config",
        HELP_TOGGLE = "/che - alterna entre chat compacto y expandido.",
        HELP_CONFIG = "/che config - abre las opciones.",
        HELP_COLLAPSED = "/che collapsed 160 - define la altura compacta.",
        HELP_EXPANDED = "/che expanded 360 - define la altura expandida.",
        HELP_BUTTON = "/che button - muestra/oculta el botón.",
        HELP_RESET = "/che reset - restaura los valores predeterminados.",
    },
    esMX = {
        CONFIG_TITLE = "Chat Height Expander - Opciones",
        OPTIONS_PANEL_HINT = "Estos ajustes también afectan el botón pequeño del chat y el comando /che.",
        COLLAPSED_HEIGHT = "Altura compacta",
        EXPANDED_HEIGHT = "Altura expandida",
        SHOW_BUTTON = "Mostrar botón del chat",
        BUTTON_POSITION = "Posición del botón",
        BUTTON_OUTSIDE = "Colocar el botón fuera del chat",
        BUTTON_OFFSET_X = "Desplazamiento horizontal",
        BUTTON_OFFSET_Y = "Desplazamiento vertical",
        BUTTON_OFFSET_HINT = "Positivo: derecha / arriba. Negativo: izquierda / abajo. Rango: -500 a 500.",
        INVALID_OFFSET = "Usa desplazamientos entre -500 y 500.",
        TOPRIGHT = "Arriba derecha",
        TOPLEFT = "Arriba izquierda",
        BOTTOMRIGHT = "Abajo derecha",
        BOTTOMLEFT = "Abajo izquierda",
        APPLY = "Aplicar",
        USE_CURRENT = "Usar altura actual como compacta",
        RESET = "Restablecer",
        CREATE_MACROS = "Crear macros",
        CLOSE = "Cerrar",
        EXPAND_TOOLTIP = "Haz clic para expandir el chat.",
        COLLAPSE_TOOLTIP = "Haz clic para compactar el chat.",
        INVALID_HEIGHT = "Usa un número mayor o igual a 60.",
        HEIGHT_SAVED = "Altura guardada:",
        BUTTON_VISIBLE = "Botón visible.",
        BUTTON_HIDDEN = "Botón oculto. Usa /che button o /che config para mostrarlo de nuevo.",
        CONFIG_RESET = "Configuración restablecida.",
        CONFIG_APPLIED = "Configuración aplicada.",
        CURRENT_SAVED = "Altura actual del chat guardada como altura compacta.",
        MACROS_CREATED = "Macros creadas o actualizadas.",
        MACRO_FULL = "No hay espacio para crear una macro global. Crea macros manualmente con: /che y /che config",
        HELP_TOGGLE = "/che - alterna entre chat compacto y expandido.",
        HELP_CONFIG = "/che config - abre las opciones.",
        HELP_COLLAPSED = "/che collapsed 160 - define la altura compacta.",
        HELP_EXPANDED = "/che expanded 360 - define la altura expandida.",
        HELP_BUTTON = "/che button - muestra/oculta el botón.",
        HELP_RESET = "/che reset - restaura los valores predeterminados.",
    },
    frFR = {
        CONFIG_TITLE = "Chat Height Expander - Options",
        OPTIONS_PANEL_HINT = "Ces paramètres affectent aussi le petit bouton de discussion et la commande /che.",
        COLLAPSED_HEIGHT = "Hauteur compacte",
        EXPANDED_HEIGHT = "Hauteur étendue",
        SHOW_BUTTON = "Afficher le bouton du chat",
        BUTTON_POSITION = "Position du bouton",
        BUTTON_OUTSIDE = "Placer le bouton hors du chat",
        BUTTON_OFFSET_X = "Décalage horizontal",
        BUTTON_OFFSET_Y = "Décalage vertical",
        BUTTON_OFFSET_HINT = "Positif : droite / haut. Négatif : gauche / bas. Limites : -500 à 500.",
        INVALID_OFFSET = "Utilisez des décalages entre -500 et 500.",
        TOPRIGHT = "Haut droite",
        TOPLEFT = "Haut gauche",
        BOTTOMRIGHT = "Bas droite",
        BOTTOMLEFT = "Bas gauche",
        APPLY = "Appliquer",
        USE_CURRENT = "Utiliser la hauteur actuelle comme compacte",
        RESET = "Réinitialiser",
        CREATE_MACROS = "Créer les macros",
        CLOSE = "Fermer",
        EXPAND_TOOLTIP = "Cliquez pour agrandir le chat.",
        COLLAPSE_TOOLTIP = "Cliquez pour réduire le chat.",
        INVALID_HEIGHT = "Utilisez un nombre supérieur ou égal à 60.",
        HEIGHT_SAVED = "Hauteur enregistrée :",
        BUTTON_VISIBLE = "Bouton visible.",
        BUTTON_HIDDEN = "Bouton masqué. Utilisez /che button ou /che config pour l'afficher à nouveau.",
        CONFIG_RESET = "Paramètres réinitialisés.",
        CONFIG_APPLIED = "Paramètres appliqués.",
        CURRENT_SAVED = "Hauteur actuelle du chat enregistrée comme hauteur compacte.",
        MACROS_CREATED = "Macros créées ou mises à jour.",
        MACRO_FULL = "Il n'y a pas de place pour créer une macro globale. Créez les macros manuellement avec : /che et /che config",
        HELP_TOGGLE = "/che - bascule entre chat compact et étendu.",
        HELP_CONFIG = "/che config - ouvre les options.",
        HELP_COLLAPSED = "/che collapsed 160 - définit la hauteur compacte.",
        HELP_EXPANDED = "/che expanded 360 - définit la hauteur étendue.",
        HELP_BUTTON = "/che button - affiche/masque le bouton.",
        HELP_RESET = "/che reset - restaure les valeurs par défaut.",
    },
    itIT = {
        CONFIG_TITLE = "Chat Height Expander - Opzioni",
        OPTIONS_PANEL_HINT = "Queste impostazioni modificano anche il piccolo pulsante della chat e il comando /che.",
        COLLAPSED_HEIGHT = "Altezza compatta",
        EXPANDED_HEIGHT = "Altezza espansa",
        SHOW_BUTTON = "Mostra pulsante chat",
        BUTTON_POSITION = "Posizione pulsante",
        BUTTON_OUTSIDE = "Posiziona il pulsante fuori dalla chat",
        BUTTON_OFFSET_X = "Spostamento orizzontale",
        BUTTON_OFFSET_Y = "Spostamento verticale",
        BUTTON_OFFSET_HINT = "Positivo: destra / alto. Negativo: sinistra / basso. Intervallo: da -500 a 500.",
        INVALID_OFFSET = "Usa spostamenti tra -500 e 500.",
        TOPRIGHT = "Alto destra",
        TOPLEFT = "Alto sinistra",
        BOTTOMRIGHT = "Basso destra",
        BOTTOMLEFT = "Basso sinistra",
        APPLY = "Applica",
        USE_CURRENT = "Usa altezza attuale come compatta",
        RESET = "Ripristina",
        CREATE_MACROS = "Crea macro",
        CLOSE = "Chiudi",
        EXPAND_TOOLTIP = "Clicca per espandere la chat.",
        COLLAPSE_TOOLTIP = "Clicca per compattare la chat.",
        INVALID_HEIGHT = "Usa un numero maggiore o uguale a 60.",
        HEIGHT_SAVED = "Altezza salvata:",
        BUTTON_VISIBLE = "Pulsante visibile.",
        BUTTON_HIDDEN = "Pulsante nascosto. Usa /che button o /che config per mostrarlo di nuovo.",
        CONFIG_RESET = "Impostazioni ripristinate.",
        CONFIG_APPLIED = "Impostazioni applicate.",
        CURRENT_SAVED = "Altezza attuale della chat salvata come altezza compatta.",
        MACROS_CREATED = "Macro create o aggiornate.",
        MACRO_FULL = "Non c'è spazio per creare una macro globale. Crea le macro manualmente con: /che e /che config",
        HELP_TOGGLE = "/che - alterna chat compatta/espansa.",
        HELP_CONFIG = "/che config - apre le opzioni.",
        HELP_COLLAPSED = "/che collapsed 160 - imposta l'altezza compatta.",
        HELP_EXPANDED = "/che expanded 360 - imposta l'altezza espansa.",
        HELP_BUTTON = "/che button - mostra/nasconde il pulsante.",
        HELP_RESET = "/che reset - ripristina i valori predefiniti.",
    },
    koKR = {
        CONFIG_TITLE = "Chat Height Expander - 옵션",
        OPTIONS_PANEL_HINT = "이 설정은 작은 채팅 버튼과 /che 명령에도 적용됩니다.",
        COLLAPSED_HEIGHT = "축소 높이",
        EXPANDED_HEIGHT = "확장 높이",
        SHOW_BUTTON = "채팅 버튼 표시",
        BUTTON_POSITION = "버튼 위치",
        BUTTON_OUTSIDE = "채팅창 바깥에 버튼 배치",
        BUTTON_OFFSET_X = "가로 위치 조정",
        BUTTON_OFFSET_Y = "세로 위치 조정",
        BUTTON_OFFSET_HINT = "양수: 오른쪽 / 위. 음수: 왼쪽 / 아래. 범위: -500~500.",
        INVALID_OFFSET = "-500에서 500 사이의 값을 입력하세요.",
        TOPRIGHT = "오른쪽 위",
        TOPLEFT = "왼쪽 위",
        BOTTOMRIGHT = "오른쪽 아래",
        BOTTOMLEFT = "왼쪽 아래",
        APPLY = "적용",
        USE_CURRENT = "현재 높이를 축소 높이로 사용",
        RESET = "초기화",
        CREATE_MACROS = "매크로 만들기",
        CLOSE = "닫기",
        EXPAND_TOOLTIP = "클릭하여 채팅을 확장합니다.",
        COLLAPSE_TOOLTIP = "클릭하여 채팅을 축소합니다.",
        INVALID_HEIGHT = "60 이상의 숫자를 입력하세요.",
        HEIGHT_SAVED = "높이 저장됨:",
        BUTTON_VISIBLE = "버튼이 표시됩니다.",
        BUTTON_HIDDEN = "버튼이 숨겨졌습니다. 다시 표시하려면 /che button 또는 /che config를 사용하세요.",
        CONFIG_RESET = "설정이 초기화되었습니다.",
        CONFIG_APPLIED = "설정이 적용되었습니다.",
        CURRENT_SAVED = "현재 채팅 높이가 축소 높이로 저장되었습니다.",
        MACROS_CREATED = "매크로가 생성되었거나 업데이트되었습니다.",
        MACRO_FULL = "전역 매크로를 만들 공간이 없습니다. /che 및 /che config로 매크로를 직접 만드세요.",
        HELP_TOGGLE = "/che - 채팅 축소/확장을 전환합니다.",
        HELP_CONFIG = "/che config - 옵션을 엽니다.",
        HELP_COLLAPSED = "/che collapsed 160 - 축소 높이를 설정합니다.",
        HELP_EXPANDED = "/che expanded 360 - 확장 높이를 설정합니다.",
        HELP_BUTTON = "/che button - 버튼을 표시/숨깁니다.",
        HELP_RESET = "/che reset - 기본값을 복원합니다.",
    },
    ruRU = {
        CONFIG_TITLE = "Chat Height Expander - Настройки",
        OPTIONS_PANEL_HINT = "Эти настройки также влияют на маленькую кнопку чата и команду /che.",
        COLLAPSED_HEIGHT = "Компактная высота",
        EXPANDED_HEIGHT = "Расширенная высота",
        SHOW_BUTTON = "Показывать кнопку чата",
        BUTTON_POSITION = "Положение кнопки",
        BUTTON_OUTSIDE = "Разместить кнопку снаружи чата",
        BUTTON_OFFSET_X = "Смещение по горизонтали",
        BUTTON_OFFSET_Y = "Смещение по вертикали",
        BUTTON_OFFSET_HINT = "Плюс: вправо / вверх. Минус: влево / вниз. Диапазон: от -500 до 500.",
        INVALID_OFFSET = "Используйте смещения от -500 до 500.",
        TOPRIGHT = "Сверху справа",
        TOPLEFT = "Сверху слева",
        BOTTOMRIGHT = "Снизу справа",
        BOTTOMLEFT = "Снизу слева",
        APPLY = "Применить",
        USE_CURRENT = "Использовать текущую высоту как компактную",
        RESET = "Сбросить",
        CREATE_MACROS = "Создать макросы",
        CLOSE = "Закрыть",
        EXPAND_TOOLTIP = "Нажмите, чтобы расширить чат.",
        COLLAPSE_TOOLTIP = "Нажмите, чтобы сделать чат компактным.",
        INVALID_HEIGHT = "Используйте число не меньше 60.",
        HEIGHT_SAVED = "Высота сохранена:",
        BUTTON_VISIBLE = "Кнопка видна.",
        BUTTON_HIDDEN = "Кнопка скрыта. Используйте /che button или /che config, чтобы показать ее снова.",
        CONFIG_RESET = "Настройки сброшены.",
        CONFIG_APPLIED = "Настройки применены.",
        CURRENT_SAVED = "Текущая высота чата сохранена как компактная.",
        MACROS_CREATED = "Макросы созданы или обновлены.",
        MACRO_FULL = "Нет места для создания глобального макроса. Создайте макросы вручную: /che и /che config",
        HELP_TOGGLE = "/che - переключает компактный/расширенный чат.",
        HELP_CONFIG = "/che config - открывает настройки.",
        HELP_COLLAPSED = "/che collapsed 160 - задает компактную высоту.",
        HELP_EXPANDED = "/che expanded 360 - задает расширенную высоту.",
        HELP_BUTTON = "/che button - показывает/скрывает кнопку.",
        HELP_RESET = "/che reset - восстанавливает значения по умолчанию.",
    },
    zhCN = {
        CONFIG_TITLE = "Chat Height Expander - 选项",
        OPTIONS_PANEL_HINT = "这些设置也会影响聊天小按钮和 /che 命令。",
        COLLAPSED_HEIGHT = "紧凑高度",
        EXPANDED_HEIGHT = "展开高度",
        SHOW_BUTTON = "显示聊天按钮",
        BUTTON_POSITION = "按钮位置",
        BUTTON_OUTSIDE = "将按钮放在聊天窗口外侧",
        BUTTON_OFFSET_X = "水平偏移",
        BUTTON_OFFSET_Y = "垂直偏移",
        BUTTON_OFFSET_HINT = "正数：右 / 上。负数：左 / 下。范围：-500 到 500。",
        INVALID_OFFSET = "请输入 -500 到 500 之间的偏移值。",
        TOPRIGHT = "右上",
        TOPLEFT = "左上",
        BOTTOMRIGHT = "右下",
        BOTTOMLEFT = "左下",
        APPLY = "应用",
        USE_CURRENT = "将当前高度设为紧凑高度",
        RESET = "重置",
        CREATE_MACROS = "创建宏",
        CLOSE = "关闭",
        EXPAND_TOOLTIP = "点击展开聊天。",
        COLLAPSE_TOOLTIP = "点击收起聊天。",
        INVALID_HEIGHT = "请输入大于或等于 60 的数字。",
        HEIGHT_SAVED = "高度已保存：",
        BUTTON_VISIBLE = "按钮已显示。",
        BUTTON_HIDDEN = "按钮已隐藏。使用 /che button 或 /che config 再次显示。",
        CONFIG_RESET = "设置已重置。",
        CONFIG_APPLIED = "设置已应用。",
        CURRENT_SAVED = "当前聊天高度已保存为紧凑高度。",
        MACROS_CREATED = "宏已创建或更新。",
        MACRO_FULL = "没有空间创建全局宏。请手动创建宏：/che 和 /che config",
        HELP_TOGGLE = "/che - 切换紧凑/展开聊天。",
        HELP_CONFIG = "/che config - 打开选项。",
        HELP_COLLAPSED = "/che collapsed 160 - 设置紧凑高度。",
        HELP_EXPANDED = "/che expanded 360 - 设置展开高度。",
        HELP_BUTTON = "/che button - 显示/隐藏按钮。",
        HELP_RESET = "/che reset - 恢复默认值。",
    },
    zhTW = {
        CONFIG_TITLE = "Chat Height Expander - 選項",
        OPTIONS_PANEL_HINT = "這些設定也會影響聊天小按鈕和 /che 指令。",
        COLLAPSED_HEIGHT = "精簡高度",
        EXPANDED_HEIGHT = "展開高度",
        SHOW_BUTTON = "顯示聊天按鈕",
        BUTTON_POSITION = "按鈕位置",
        BUTTON_OUTSIDE = "將按鈕放在聊天視窗外側",
        BUTTON_OFFSET_X = "水平偏移",
        BUTTON_OFFSET_Y = "垂直偏移",
        BUTTON_OFFSET_HINT = "正數：右 / 上。負數：左 / 下。範圍：-500 到 500。",
        INVALID_OFFSET = "請輸入 -500 到 500 之間的偏移值。",
        TOPRIGHT = "右上",
        TOPLEFT = "左上",
        BOTTOMRIGHT = "右下",
        BOTTOMLEFT = "左下",
        APPLY = "套用",
        USE_CURRENT = "將目前高度設為精簡高度",
        RESET = "重設",
        CREATE_MACROS = "建立巨集",
        CLOSE = "關閉",
        EXPAND_TOOLTIP = "點擊以展開聊天。",
        COLLAPSE_TOOLTIP = "點擊以收合聊天。",
        INVALID_HEIGHT = "請使用大於或等於 60 的數字。",
        HEIGHT_SAVED = "高度已儲存：",
        BUTTON_VISIBLE = "按鈕已顯示。",
        BUTTON_HIDDEN = "按鈕已隱藏。使用 /che button 或 /che config 再次顯示。",
        CONFIG_RESET = "設定已重設。",
        CONFIG_APPLIED = "設定已套用。",
        CURRENT_SAVED = "目前聊天高度已儲存為精簡高度。",
        MACROS_CREATED = "巨集已建立或更新。",
        MACRO_FULL = "沒有空間建立全域巨集。請手動建立巨集：/che 和 /che config",
        HELP_TOGGLE = "/che - 切換精簡/展開聊天。",
        HELP_CONFIG = "/che config - 開啟選項。",
        HELP_COLLAPSED = "/che collapsed 160 - 設定精簡高度。",
        HELP_EXPANDED = "/che expanded 360 - 設定展開高度。",
        HELP_BUTTON = "/che button - 顯示/隱藏按鈕。",
        HELP_RESET = "/che reset - 還原預設值。",
    },
}

LOCALES.enGB = LOCALES.enUS

local function GetLocalizedStrings(locale)
    local strings = LOCALES[locale] or LOCALES.enUS
    if strings ~= LOCALES.enUS then
        setmetatable(strings, { __index = LOCALES.enUS })
    end
    return strings
end

local L = GetLocalizedStrings(LOCALE)

local DEFAULTS = {
    collapsedHeight = 160,
    expandedHeight = 360,
    expanded = false,
    buttonShown = true,
    buttonPosition = "TOPRIGHT",
    buttonOutside = false,
    buttonOffsetX = 0,
    buttonOffsetY = 0,
    initialized = false,
}

local BUTTON_POSITIONS = {
    { value = "TOPRIGHT", label = L.TOPRIGHT, point = "TOPRIGHT", outsidePoint = "TOPLEFT", relativePoint = "TOPRIGHT", x = -2, y = -2 },
    { value = "TOPLEFT", label = L.TOPLEFT, point = "TOPLEFT", outsidePoint = "TOPRIGHT", relativePoint = "TOPLEFT", x = 2, y = -2 },
    { value = "BOTTOMRIGHT", label = L.BOTTOMRIGHT, point = "BOTTOMRIGHT", outsidePoint = "BOTTOMLEFT", relativePoint = "BOTTOMRIGHT", x = -2, y = 2 },
    { value = "BOTTOMLEFT", label = L.BOTTOMLEFT, point = "BOTTOMLEFT", outsidePoint = "BOTTOMRIGHT", relativePoint = "BOTTOMLEFT", x = 2, y = 2 },
}

local db
local buttons = {}
local hookedChatFrames = {}
local originalLayers = {}
local configWindow
local optionsPanel
local configControls = {}

local function CopyDefaults(target, defaults)
    for key, value in pairs(defaults) do
        if target[key] == nil then
            target[key] = value
        end
    end
end

local function Print(message)
    DEFAULT_CHAT_FRAME:AddMessage("|cff66ccff" .. L.ADDON_NAME .. ":|r " .. message)
end

local function GetChatFrame()
    return SELECTED_CHAT_FRAME or _G.ChatFrame1
end

local function GetChatFrameCount()
    return NUM_CHAT_WINDOWS or 10
end

local function GetButtonPosition(value)
    for _, position in ipairs(BUTTON_POSITIONS) do
        if position.value == value then
            return position
        end
    end
    return BUTTON_POSITIONS[1]
end

local function SaveChatSize(frame)
    if FCF_SavePositionAndDimensions then
        FCF_SavePositionAndDimensions(frame)
    end
end

local function SetChatHeight(frame, height)
    if frame then
        frame:SetHeight(height)
        SaveChatSize(frame)
    end
end

local function SetAllChatHeights(height)
    for index = 1, GetChatFrameCount() do
        SetChatHeight(_G["ChatFrame" .. index], height)
    end
end

local function SaveOriginalLayer(frame)
    if frame and not originalLayers[frame] then
        originalLayers[frame] = {
            strata = frame:GetFrameStrata(),
            level = frame:GetFrameLevel(),
        }
    end
end

local function RaiseChatLayer(frame)
    if not frame then
        return
    end

    SaveOriginalLayer(frame)
    frame:SetFrameStrata("FULLSCREEN_DIALOG")
    frame:SetFrameLevel(100)
end

local function RestoreChatLayer(frame)
    local layer = frame and originalLayers[frame]
    if not layer then
        return
    end

    frame:SetFrameStrata(layer.strata or "MEDIUM")
    frame:SetFrameLevel(layer.level or 0)
    originalLayers[frame] = nil
end

local function ApplyChatLayers()
    for index = 1, GetChatFrameCount() do
        local frame = _G["ChatFrame" .. index]
        if db.expanded then
            RaiseChatLayer(frame)
        else
            RestoreChatLayer(frame)
        end
    end
end

local function PositionButton(frame, button)
    local position = GetButtonPosition(db.buttonPosition)
    local point = db.buttonOutside and position.outsidePoint or position.point
    local x = db.buttonOutside and -position.x or position.x
    button:ClearAllPoints()
    button:SetPoint(point, frame, position.relativePoint, x + db.buttonOffsetX, position.y + db.buttonOffsetY)
end

local function RefreshChatButtons()
    if not db then
        return
    end

    for frame, chatButton in pairs(buttons) do
        PositionButton(frame, chatButton)
        chatButton:SetFrameStrata(frame:GetFrameStrata())
        chatButton:SetFrameLevel(frame:GetFrameLevel() + 20)

        if db.buttonShown then
            chatButton:Show()
        else
            chatButton:Hide()
        end

        if db.expanded then
            chatButton:SetText("-")
            chatButton:SetScript("OnEnter", function(self)
                GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
                GameTooltip:SetText(L.TITLE)
                GameTooltip:AddLine(L.COLLAPSE_TOOLTIP, 1, 1, 1)
                GameTooltip:Show()
            end)
        else
            chatButton:SetText("+")
            chatButton:SetScript("OnEnter", function(self)
                GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
                GameTooltip:SetText(L.TITLE)
                GameTooltip:AddLine(L.EXPAND_TOOLTIP, 1, 1, 1)
                GameTooltip:Show()
            end)
        end
    end
end

local CreateChatButtons

local function ApplyState()
    CreateChatButtons()
    SetAllChatHeights(db.expanded and db.expandedHeight or db.collapsedHeight)
    ApplyChatLayers()
    RefreshChatButtons()
end

local function LearnCurrentChatHeight()
    if db.initialized then
        return
    end

    local frame = GetChatFrame()
    if not frame then
        return
    end

    local currentHeight = math.floor(frame:GetHeight() + 0.5)
    db.collapsedHeight = currentHeight
    db.expandedHeight = math.max(currentHeight + 180, DEFAULTS.expandedHeight)
    db.initialized = true
end

local function Toggle()
    db.expanded = not db.expanded
    ApplyState()
end

local function CreateChatButton(frame, index)
    if not frame or buttons[frame] then
        return
    end

    local chatButton = CreateFrame("Button", "ChatHeightExpanderButton" .. index, frame, "UIPanelButtonTemplate")
    chatButton:SetSize(20, 20)
    chatButton:SetFrameStrata(frame:GetFrameStrata())
    chatButton:SetFrameLevel(frame:GetFrameLevel() + 20)
    chatButton:SetScript("OnClick", Toggle)
    chatButton:SetScript("OnLeave", function()
        GameTooltip:Hide()
    end)

    buttons[frame] = chatButton

    if not hookedChatFrames[frame] then
        hookedChatFrames[frame] = true
        frame:HookScript("OnShow", function()
            if db.expanded then
                RaiseChatLayer(frame)
            end
            RefreshChatButtons()
        end)
    end
end

CreateChatButtons = function()
    for index = 1, GetChatFrameCount() do
        CreateChatButton(_G["ChatFrame" .. index], index)
    end

    RefreshChatButtons()
end

local function CreateLabel(parent, text)
    local label = parent:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    label:SetText(text)
    return label
end

local function CreateButtonControl(parent, text, width)
    local control = CreateFrame("Button", nil, parent, "UIPanelButtonTemplate")
    control:SetSize(width or 110, 24)
    control:SetText(text)
    return control
end

local function CreateEditBox(parent, width, closeOnEscape)
    local edit = CreateFrame("EditBox", nil, parent, "InputBoxTemplate")
    edit:SetSize(width or 80, 24)
    edit:SetFontObject(ChatFontNormal)
    edit:SetTextColor(1, 1, 1, 1)
    edit:SetJustifyH("LEFT")
    edit:SetAutoFocus(false)
    edit:SetMaxLetters(5)
    edit:SetScript("OnEscapePressed", function(self)
        self:ClearFocus()
        if closeOnEscape and configWindow then
            configWindow:Hide()
        end
    end)
    edit:SetScript("OnEnterPressed", function(self)
        self:ClearFocus()
    end)
    return edit
end

local function CreateDropdown(parent, name, width)
    local dropdown = CreateFrame("Frame", name, parent, "UIDropDownMenuTemplate")
    UIDropDownMenu_SetWidth(dropdown, width or 150)
    return dropdown
end

local function SetDropdownText(dropdown, text)
    if UIDropDownMenu_SetText then
        UIDropDownMenu_SetText(dropdown, text)
    elseif dropdown:GetName() and _G[dropdown:GetName() .. "Text"] then
        _G[dropdown:GetName() .. "Text"]:SetText(text)
    end
end

local function RegisterConfigControls(owner)
    table.insert(configControls, owner)
end

local function RefreshConfigControls()
    if not db then
        return
    end

    for _, owner in ipairs(configControls) do
        owner.collapsedBox:SetText(tostring(db.collapsedHeight or DEFAULTS.collapsedHeight))
        owner.expandedBox:SetText(tostring(db.expandedHeight or DEFAULTS.expandedHeight))
        owner.showButton:SetChecked(db.buttonShown and true or false)
        owner.buttonOutside:SetChecked(db.buttonOutside and true or false)
        owner.buttonOffsetX:SetText(tostring(db.buttonOffsetX))
        owner.buttonOffsetY:SetText(tostring(db.buttonOffsetY))
        SetDropdownText(owner.positionDropdown, GetButtonPosition(db.buttonPosition).label)
    end
end

local function ReadHeight(editBox)
    local value = tonumber(editBox:GetText() or "")
    if not value or value < 60 then
        return nil
    end
    return math.floor(value + 0.5)
end

local function ReadOffset(editBox)
    local value = tonumber(editBox:GetText() or "")
    if not value or value ~= value or value < -500 or value > 500 then
        return nil
    end
    return math.floor(value + 0.5)
end

local function ApplyConfigControls(owner)
    local collapsedHeight = ReadHeight(owner.collapsedBox)
    local expandedHeight = ReadHeight(owner.expandedBox)

    if not collapsedHeight or not expandedHeight then
        Print(L.INVALID_HEIGHT)
        RefreshConfigControls()
        return
    end

    local offsetX = ReadOffset(owner.buttonOffsetX)
    local offsetY = ReadOffset(owner.buttonOffsetY)
    if not offsetX or not offsetY then
        Print(L.INVALID_OFFSET)
        RefreshConfigControls()
        return
    end

    db.buttonOffsetX = offsetX
    db.buttonOffsetY = offsetY
    db.collapsedHeight = collapsedHeight
    db.expandedHeight = expandedHeight
    db.buttonShown = owner.showButton:GetChecked() and true or false
    ApplyState()
    RefreshConfigControls()
    Print(L.CONFIG_APPLIED)
end

local function UseCurrentAsCompact()
    local frame = GetChatFrame()
    if not frame then
        return
    end

    db.collapsedHeight = math.floor(frame:GetHeight() + 0.5)
    db.initialized = true
    RefreshConfigControls()
    ApplyState()
    Print(L.CURRENT_SAVED)
end

local function ResetConfig()
    for key, value in pairs(DEFAULTS) do
        db[key] = value
    end
    RefreshConfigControls()
    ApplyState()
    Print(L.CONFIG_RESET)
end

local function HasGlobalMacroSpace()
    if not GetNumMacros then
        return true
    end

    local globalMacros = GetNumMacros()
    local maxGlobalMacros = MAX_ACCOUNT_MACROS or 120
    return (globalMacros or 0) < maxGlobalMacros
end

local function HasGlobalMacroSpaceFor(count)
    if not GetNumMacros then
        return true
    end

    local globalMacros = GetNumMacros()
    local maxGlobalMacros = MAX_ACCOUNT_MACROS or 120
    return ((globalMacros or 0) + count) <= maxGlobalMacros
end

local function CreateOrUpdateMacro(name, body)
    local icon = "INV_Misc_Note_01"
    local macroIndex = GetMacroIndexByName and GetMacroIndexByName(name) or 0

    if macroIndex and macroIndex > 0 then
        EditMacro(macroIndex, name, icon, body, nil, nil)
        return true
    end

    if not HasGlobalMacroSpace() then
        return false
    end

    CreateMacro(name, icon, body, nil, nil)
    return true
end

local function CreateMacros()
    if not CreateMacro or not EditMacro then
        Print(L.MACRO_FULL)
        return
    end

    local missing = 0
    local toggleIndex = GetMacroIndexByName and GetMacroIndexByName("CHE Toggle") or 0
    local optionsIndex = GetMacroIndexByName and GetMacroIndexByName("CHE Options") or 0
    if not toggleIndex or toggleIndex == 0 then
        missing = missing + 1
    end
    if not optionsIndex or optionsIndex == 0 then
        missing = missing + 1
    end
    if not HasGlobalMacroSpaceFor(missing) then
        Print(L.MACRO_FULL)
        return
    end

    local toggleOk = CreateOrUpdateMacro("CHE Toggle", "/che")
    local optionsOk = CreateOrUpdateMacro("CHE Options", "/che config")

    if toggleOk and optionsOk then
        Print(L.MACROS_CREATED)
    else
        Print(L.MACRO_FULL)
    end
end

local function AddConfigControls(parent, prefix, topOffset, includeCloseButton)
    local owner = parent
    topOffset = topOffset or 0

    local collapsedLabel = CreateLabel(parent, L.COLLAPSED_HEIGHT)
    collapsedLabel:SetPoint("TOPLEFT", 24, -46 - topOffset)
    owner.collapsedBox = CreateEditBox(parent, 80, includeCloseButton)
    owner.collapsedBox:SetPoint("LEFT", collapsedLabel, "RIGHT", 24, 0)

    local expandedLabel = CreateLabel(parent, L.EXPANDED_HEIGHT)
    expandedLabel:SetPoint("TOPLEFT", 24, -82 - topOffset)
    owner.expandedBox = CreateEditBox(parent, 80, includeCloseButton)
    owner.expandedBox:SetPoint("LEFT", expandedLabel, "RIGHT", 18, 0)

    owner.showButton = CreateFrame("CheckButton", nil, parent, "InterfaceOptionsCheckButtonTemplate")
    owner.showButton:SetPoint("TOPLEFT", 20, -116 - topOffset)
    owner.showButton.Text:SetText(L.SHOW_BUTTON)
    owner.showButton:SetScript("OnClick", function(self)
        db.buttonShown = self:GetChecked() and true or false
        RefreshChatButtons()
        RefreshConfigControls()
    end)

    local positionLabel = CreateLabel(parent, L.BUTTON_POSITION)
    positionLabel:SetPoint("TOPLEFT", 24, -154 - topOffset)
    owner.positionDropdown = CreateDropdown(parent, prefix .. "PositionDropdown", 170)
    owner.positionDropdown:SetPoint("TOPLEFT", 145, -148 - topOffset)
    UIDropDownMenu_Initialize(owner.positionDropdown, function(dropdown, level)
        if level ~= 1 then
            return
        end

        for _, position in ipairs(BUTTON_POSITIONS) do
            local info = UIDropDownMenu_CreateInfo()
            info.text = position.label
            info.checked = db.buttonPosition == position.value
            info.func = function()
                db.buttonPosition = position.value
                SetDropdownText(dropdown, position.label)
                RefreshChatButtons()
                RefreshConfigControls()
            end
            UIDropDownMenu_AddButton(info, level)
        end
    end)

    owner.buttonOutside = CreateFrame("CheckButton", nil, parent, "InterfaceOptionsCheckButtonTemplate")
    owner.buttonOutside:SetPoint("TOPLEFT", 20, -186 - topOffset)
    owner.buttonOutside.Text:SetText(L.BUTTON_OUTSIDE)
    owner.buttonOutside:SetScript("OnClick", function(self)
        db.buttonOutside = self:GetChecked() and true or false
        RefreshChatButtons()
        RefreshConfigControls()
    end)

    local offsetXLabel = CreateLabel(parent, L.BUTTON_OFFSET_X)
    offsetXLabel:SetPoint("TOPLEFT", 24, -224 - topOffset)
    owner.buttonOffsetX = CreateEditBox(parent, 80, includeCloseButton)
    owner.buttonOffsetX:SetPoint("TOPLEFT", 224, -218 - topOffset)

    local offsetYLabel = CreateLabel(parent, L.BUTTON_OFFSET_Y)
    offsetYLabel:SetPoint("TOPLEFT", 24, -260 - topOffset)
    owner.buttonOffsetY = CreateEditBox(parent, 80, includeCloseButton)
    owner.buttonOffsetY:SetPoint("TOPLEFT", 224, -254 - topOffset)

    local offsetHint = CreateLabel(parent, L.BUTTON_OFFSET_HINT)
    offsetHint:SetPoint("TOPLEFT", 24, -290 - topOffset)
    offsetHint:SetWidth(372)
    offsetHint:SetJustifyH("LEFT")

    local applyButton = CreateButtonControl(parent, L.APPLY, 90)
    applyButton:SetPoint("TOPLEFT", 24, -334 - topOffset)
    applyButton:SetScript("OnClick", function()
        ApplyConfigControls(owner)
    end)

    local currentButton = CreateButtonControl(parent, L.USE_CURRENT, 190)
    currentButton:SetPoint("LEFT", applyButton, "RIGHT", 8, 0)
    currentButton:SetScript("OnClick", UseCurrentAsCompact)

    local resetButton = CreateButtonControl(parent, L.RESET, 90)
    resetButton:SetPoint("TOPLEFT", 24, -368 - topOffset)
    resetButton:SetScript("OnClick", ResetConfig)

    local macroButton = CreateButtonControl(parent, L.CREATE_MACROS, 130)
    macroButton:SetPoint("LEFT", resetButton, "RIGHT", 8, 0)
    macroButton:SetScript("OnClick", CreateMacros)

    if includeCloseButton then
        local closeButton = CreateButtonControl(parent, L.CLOSE, 90)
        closeButton:SetPoint("LEFT", macroButton, "RIGHT", 8, 0)
        closeButton:SetScript("OnClick", function()
            parent:Hide()
        end)
    end

    RegisterConfigControls(owner)
end

local function CreateConfigWindow()
    if configWindow then
        return configWindow
    end

    local frame = CreateFrame("Frame", "ChatHeightExpanderConfigWindow", UIParent, "BasicFrameTemplateWithInset")
    frame:SetSize(420, 430)
    frame:SetPoint("CENTER")
    frame:SetFrameStrata("DIALOG")
    frame:SetMovable(true)
    frame:EnableMouse(true)
    frame:RegisterForDrag("LeftButton")
    frame:SetScript("OnDragStart", frame.StartMoving)
    frame:SetScript("OnDragStop", frame.StopMovingOrSizing)
    frame:Hide()

    if UISpecialFrames then
        table.insert(UISpecialFrames, "ChatHeightExpanderConfigWindow")
    end

    local title = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    title:SetPoint("TOP", frame, "TOP", 0, -6)
    title:SetText(L.CONFIG_TITLE)

    AddConfigControls(frame, "ChatHeightExpanderWindow", 0, true)

    configWindow = frame
    return frame
end

local function CreateOptionsPanel()
    if optionsPanel then
        return optionsPanel
    end

    local panel = CreateFrame("Frame", "ChatHeightExpanderOptionsPanel", UIParent)
    panel.name = L.ADDON_NAME
    panel:SetSize(560, 460)
    panel:Hide()

    local title = panel:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
    title:SetPoint("TOPLEFT", 16, -16)
    title:SetText(L.TITLE)

    local hint = panel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
    hint:SetPoint("TOPLEFT", 16, -42)
    hint:SetText(L.OPTIONS_PANEL_HINT)
    hint:SetWidth(500)
    hint:SetJustifyH("LEFT")

    AddConfigControls(panel, "ChatHeightExpanderOptions", 32, false)
    panel:SetScript("OnShow", RefreshConfigControls)

    if InterfaceOptions_AddCategory then
        InterfaceOptions_AddCategory(panel)
    elseif Settings and Settings.RegisterCanvasLayoutCategory then
        local category = Settings.RegisterCanvasLayoutCategory(panel, panel.name)
        Settings.RegisterAddOnCategory(category)
    end

    optionsPanel = panel
    return panel
end

local function OpenConfig()
    CreateConfigWindow()
    RefreshConfigControls()
    configWindow:Show()
end

local function SetNumberOption(option, value)
    value = tonumber(value)
    if not value or value < 60 then
        Print(L.INVALID_HEIGHT)
        return
    end

    db[option] = math.floor(value + 0.5)
    ApplyState()
    RefreshConfigControls()
    Print(L.HEIGHT_SAVED .. " " .. db[option] .. ".")
end

local function ShowHelp()
    Print(L.HELP_TOGGLE)
    Print(L.HELP_CONFIG)
    Print(L.HELP_COLLAPSED)
    Print(L.HELP_EXPANDED)
    Print(L.HELP_BUTTON)
    Print(L.HELP_RESET)
end

local function HandleSlash(input)
    local command, value = string.match(string.lower(input or ""), "^(%S*)%s*(.*)$")

    if command == "" then
        Toggle()
    elseif command == "config" or command == "options" or command == "opcoes" then
        OpenConfig()
    elseif command == "compacta" or command == "normal" or command == "collapsed" then
        SetNumberOption("collapsedHeight", value)
    elseif command == "expandida" or command == "expanded" then
        SetNumberOption("expandedHeight", value)
    elseif command == "botao" or command == "button" then
        db.buttonShown = not db.buttonShown
        RefreshChatButtons()
        RefreshConfigControls()
        Print(db.buttonShown and L.BUTTON_VISIBLE or L.BUTTON_HIDDEN)
    elseif command == "reset" then
        ResetConfig()
    else
        ShowHelp()
    end
end

local events = CreateFrame("Frame")
events:RegisterEvent("ADDON_LOADED")
events:RegisterEvent("PLAYER_LOGIN")
events:SetScript("OnEvent", function(_, event, addonName)
    if event == "ADDON_LOADED" and addonName == ADDON_NAME then
        ChatHeightExpanderDB = ChatHeightExpanderDB or {}
        db = ChatHeightExpanderDB
        CopyDefaults(db, DEFAULTS)

        SLASH_CHATHEIGHTEXPANDER1 = "/che"
        SLASH_CHATHEIGHTEXPANDER2 = "/chatheight"
        SlashCmdList.CHATHEIGHTEXPANDER = HandleSlash
        CreateOptionsPanel()
    elseif event == "PLAYER_LOGIN" then
        if not db then
            ChatHeightExpanderDB = ChatHeightExpanderDB or {}
            db = ChatHeightExpanderDB
            CopyDefaults(db, DEFAULTS)
        end

        C_Timer.After(0.5, function()
            LearnCurrentChatHeight()
            CreateChatButtons()
            ApplyState()
            RefreshConfigControls()
        end)
    end
end)
