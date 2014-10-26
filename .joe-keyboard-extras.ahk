
;------------------------------------------------------------------------------
; 
;       Joe's Windows Keyboard Hotkeys \ o /
; 
;------------------------------------------------------------------------------

; 
;       Alt-Gr + f -> Backtick
; 
; alt+ctrl (alt-gr) + f will send the back tick normally found above tab
; this is missing on my keyboard : (
<^!f::SendRaw ``

; 
;       Vim
; 
; ctrl+q -> remaps to 'open context menu'
#IfWinNotActive ahk_class Vim
{
    #IfWinNotActive ahk_class K2_ContainerWindow
    {
        #IfWinNotActive ahk_class K2_D9
        {
            ^q::Send +{F10}
        }
    }
}

; 
;       Windows Explorer
; 
#IfWinActive ahk_class CabinetWClass
{
    ; ctrl+p -> open powershell in the current folder
    ^p:: 
    {
        ; backup the old contents of the clipboard, and restore it when we are done
        ClipSaved := ClipboardAll

        ; copies the address out from explorer
        ; and leaves you in the file list
        Send ^l^c{Tab}{Tab}{Tab}
        ClipWait, 2
        Run powershell, %Clipboard%

        Clipboard := ClipSaved
        ClipSaved :=            ; set the temperary variable to no data
    }

    ; ctrl+q -> remaps to 'delete'
    ^q:: Send {delete}

    ; ctrl+e -> edit with vim
    ^e:: Send ^{Tab}+{F10}v

    ; ctrl+f -> new text file
    ^f:: Send !hn

    ; ctrl+r -> create new blank text file
    ^r:: Send !hw{up}{up}{up}{enter}
}

; adds 'get url'
#IfWinActive ahk_class MozillaWindowClass
{
    ^m:: Send +{F10}{up}{enter}
}

#IfWinActive ahk_class Chrome_WidgetWin_1
{
    ^m:: Send ^l^c{tab}
}




