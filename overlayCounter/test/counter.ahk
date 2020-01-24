#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#Singleinstance, Force
#Persistent

FileRead, FileSelected, count.txt
Counter = 0  ; Start counter at zero
Counter = %FileSelected%

sHeight := A_ScreenHeight-260
sWidth := A_ScreenWidth-250

Gui, Color, 000000
Gui, Font, S24, Lato
Gui, Add, Text, Center cWhite vWinText , Luma Count
Gui, Font, S72, Lato

Gui, Add, Text, BackgroundTrans vT1 w200, %Counter%
Gui, Add, Text, xp-3 yp-3 cFFFFFF w200 BackgroundTrans vT2, %Counter%
Gui +LastFound +AlwaysOnTop +ToolWindow
WinSet, TransColor, 000000 
Gui -Caption
Gui, Show, x%sWidth% y%sHeight%
; SetTimer, Update, 1000
return

\::
Counter++
GuiControl,, T1, %Counter% 
GuiControl,, T2, %Counter% 

FileAppend, , count.txt ; create the file
FileRead, Contents, count.txt ; read the contents of the file
if not ErrorLevel  ; Successfully loaded.
{
    FileDelete, count.txt ; delete the file 
    FileAppend, %Counter%, count.txt
    FileAppend, %Contents% , log.txt
}

; FileAppend,%Counter%,%A_ScriptDir%[color=red]\[/color]count.txt
return

#]::
Counter++
GuiControl,, T1, %Counter% 
GuiControl,, T2, %Counter% 
return

#[::
Counter--
GuiControl,, T1, %Counter% 
GuiControl,, T2, %Counter% 
return

GuiClose:
    ExitApp, return

#Esc::ExitApp
