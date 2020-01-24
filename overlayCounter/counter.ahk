#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#Singleinstance, Force
#Persistent

; CONSTANT DELCARATION
TITLE = Luma Count
LOGFILENAME = debug.log
COUNTFILENAME = count.txt
FONTNAME = Lato



FileRead, FileSelected, %COUNTFILENAME%
Counter = 0  ; Start counter at zero
Counter = %FileSelected%

sHeight := A_ScreenHeight-260
sWidth := A_ScreenWidth-250

Gui, Color, 000000
Gui, Font, S24, %FONTNAME%
Gui, Add, Text, Center cWhite vWinText , %TITLE%
Gui, Font, S72, %FONTNAME%
Gui, Add, Text, BackgroundTrans vT1 w200, %Counter%
Gui, Add, Text, xp-3 yp-3 cFFFFFF w200 BackgroundTrans vT2, %Counter%
Gui +LastFound +AlwaysOnTop +ToolWindow
WinSet, TransColor, 000000 
Gui -Caption
Gui, Show, x%sWidth% y%sHeight%
return

\::
Goto Increment
return

#]::
Goto Increment
return

#[::
Counter--
GuiControl,, T1, %Counter% 
GuiControl,, T2, %Counter% 
return

GuiClose:
    ExitApp, return

#Esc::ExitApp

Increment:
    Counter++
    Goto Update
return

Decrement:
    Counter--
    Goto Update
return

Update:
    GuiControl,, T1, %Counter% 
    GuiControl,, T2, %Counter% 

    FileAppend,, %COUNTFILENAME% ; create the file
    FileRead, Contents, %COUNTFILENAME% ; read the contents of the file
    if not ErrorLevel ; Successfully loaded.
    {
        FileDelete, %COUNTFILENAME% ; delete the file 
        FileAppend, %Counter%, %COUNTFILENAME%
        FileAppend, %Contents% , %LOGFILENAME%
    }
return