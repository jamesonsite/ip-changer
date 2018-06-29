#include <GuiConstants.au3>
#include <EditConstants.au3>
#include <WindowsConstants.au3>
#include <StaticConstants.au3>
#RequireAdmin
#region GLOBAL VARIABLES
Global $iW = 600, $iH = 400, $iT = 52, $iB = 52, $iLeftWidth = 150, $iGap = 10, $hMainGUI
#endregion GLOBAL VARIABLES

_MainGui()

Func _MainGui()
Local $hFooter, $nMsg, $aPos
Local $iLinks = 5
Local $sMainGuiTitle = "IP Changer 9000"
Local $sHeader = "Self Explanatory"
Local $sFooter = "2018 © Discreet Orphan Rentals Ltd."
Local $aLink[$iLinks], $aPanel[$iLinks]
$aLink[0] = $iLinks - 1
$aPanel[0] = $iLinks - 1

If @OSArch == "X64" Then
     $WindowsActualTrueSystemFolder = @WindowsDir & "sysnative"
Else
     $WindowsActualTrueSystemFolder = @SystemDir
EndIf

$hMainGUI = GUICreate($sMainGuiTitle, $iW, $iH, -1, -1, BitOR($GUI_SS_DEFAULT_GUI, $WS_MAXIMIZEBOX, $WS_TABSTOP))
GUISetIcon("shell32.dll", -150, $hMainGUI)

GUICtrlCreateLabel($sHeader, 48, 8, $iW - 56, 32, $SS_CENTERIMAGE)
GUICtrlSetFont(-1, 14, 800, 0, "Arial", 5)
GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)

GUICtrlCreateIcon("shell32.dll", -19, 8, 8, 32, 32)
GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
GUICtrlCreateLabel("", 0, $iT, $iW, 2, $SS_SUNKEN);separator
GUICtrlSetResizing(-1, $GUI_DOCKTOP + $GUI_DOCKLEFT + $GUI_DOCKRIGHT + $GUI_DOCKHEIGHT)
GUICtrlCreateLabel("", $iLeftWidth, $iT + 2, 2, $iH - $iT - $iB - 2, $SS_SUNKEN);separator
GUICtrlSetResizing(-1, $GUI_DOCKTOP + $GUI_DOCKLEFT + $GUI_DOCKBOTTOM + $GUI_DOCKWIDTH)
GUICtrlCreateLabel("", 0, $iH - $iB, $iW, 2, $SS_SUNKEN);separator
GUICtrlSetResizing(-1, $GUI_DOCKBOTTOM + $GUI_DOCKLEFT + $GUI_DOCKRIGHT + $GUI_DOCKHEIGHT)

$hFooter = GUICtrlCreateLabel($sFooter, 10, $iH - 34, $iW - 20, 17, BitOR($SS_LEFT, $SS_CENTERIMAGE))
GUICtrlSetTip(-1, "IP Changer 9000", "DO NOT Click to open...")
GUICtrlSetCursor(-1, 0)
GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKRIGHT + $GUI_DOCKBOTTOM + $GUI_DOCKHEIGHT)

;add links to the left side
$aLink[2] = _AddNewLink("Netsh")
$aLink[1] = _AddNewLink("Info", -167)
$aLink[3] = _AddNewLink("Advice", -222)
$aLink[4] = _AddNewLink("Settings", -22)
;and the corresponding GUI's
$aPanel[2] = _AddNewPanel("Sometimes A FULL System Restart MUST Be Completed")
$aPanel[1] = _AddNewPanel("Information")
$aPanel[3] = _AddNewPanel("Friendly Advice")
$aPanel[4] = _AddNewPanel("Settings")

;add some controls to the panels
_AddControlsToPanel($aPanel[1])
GUICtrlCreateEdit("", 10, 37, $iW - $iLeftWidth + 2 - 20 - 5, $iH - $iT - $iB - 40, BitOR($ES_AUTOVSCROLL, $ES_NOHIDESEL, $ES_WANTRETURN, $WS_VSCROLL), $WS_EX_STATICEDGE)
Local $sTestTxt = ""
For $i = 1 To 1
$sTestTxt &= @TAB & "" & @CRLF & @CRLF
$sTestTxt &= @TAB & "Software " & @CRLF & @CRLF
$sTestTxt &= @TAB & "         to" & @CRLF & @CRLF
$sTestTxt &= @TAB & "            do" & @CRLF & @CRLF
$sTestTxt &= @TAB & "               things" & @CRLF & @CRLF


Next
GUICtrlSetData(-1, $sTestTxt)
GUICtrlSetResizing(-1, $GUI_DOCKTOP + $GUI_DOCKLEFT + $GUI_DOCKRIGHT + $GUI_DOCKBOTTOM)

_AddControlsToPanel($aPanel[2])
GUICtrlCreateLabel("Net Name", 8, 57, 56, 27)
GUICtrlSetResizing(-1, $GUI_DOCKTOP + $GUI_DOCKLEFT + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
Global $sInput1 = GUICtrlCreateInput("Ethernet", 65, 57, 131, 21)

GUICtrlCreateLabel("IP", 8, 92, 56, 27)
GUICtrlSetResizing(-1, $GUI_DOCKTOP + $GUI_DOCKLEFT + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
Global $_Input2 = GUICtrlCreateInput("192.168.1.101", 65, 90, 131, 21)
GUICtrlSetResizing(-1, $GUI_DOCKTOP + $GUI_DOCKLEFT + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)

GUICtrlCreateLabel("Subnet", 8, 127, 56, 27)
GUICtrlSetResizing(-1, $GUI_DOCKTOP + $GUI_DOCKLEFT + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
Global $sInput3 = GUICtrlCreateInput("255.255.255.0", 65, 125, 131, 21)
GUICtrlSetResizing(-1, $GUI_DOCKTOP + $GUI_DOCKLEFT + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)

GUICtrlCreateLabel("Gateway", 8, 162, 56, 27)
GUICtrlSetResizing(-1, $GUI_DOCKTOP + $GUI_DOCKLEFT + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
Global $sInput4 = GUICtrlCreateInput("192.168.1.1", 65, 160, 131, 21)
GUICtrlSetResizing(-1, $GUI_DOCKTOP + $GUI_DOCKLEFT + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)

GUICtrlSetResizing(-1, $GUI_DOCKTOP + $GUI_DOCKLEFT + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
Global $hButton1 = GUICtrlCreateButton("OK", 230, 57, 75, 25)
GUICtrlSetResizing(-1, $GUI_DOCKTOP + $GUI_DOCKLEFT + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)

GUICtrlSetResizing(-1, $GUI_DOCKTOP + $GUI_DOCKLEFT + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
Global $hButton2 = GUICtrlCreateButton("DHCP", 320, 57, 75, 25)
GUICtrlSetResizing(-1, $GUI_DOCKTOP + $GUI_DOCKLEFT + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)

GUICtrlSetResizing(-1, $GUI_DOCKTOP + $GUI_DOCKLEFT + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
Global $hButton3 = GUICtrlCreateButton("Network Connections", 270, 180, 115, 25)
GUICtrlSetResizing(-1, $GUI_DOCKTOP + $GUI_DOCKLEFT + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)

_AddControlsToPanel($aPanel[3])
GUICtrlCreateList("", 8, 37, 121, 93, -1, 0)
GUICtrlSetData(-1, "dfgdfg|ertert|kljlkj|poipoi|qweqwe")
GUICtrlSetResizing(-1, $GUI_DOCKTOP + $GUI_DOCKLEFT + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)

_AddControlsToPanel($aPanel[4])
GUICtrlCreateGroup("Group1", 8, 35, 129, 90)
GUICtrlSetResizing(-1, $GUI_DOCKTOP + $GUI_DOCKLEFT + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
Local $aChkBox[4]
For $i = 1 To 3
$aChkBox[$i] = GUICtrlCreateRadio("Some radio " & $i, 16, 56 + ($i - 1) * 20, 113, 17)
GUICtrlSetResizing(-1, $GUI_DOCKTOP + $GUI_DOCKLEFT + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
Next
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlCreateGroup("", -99, -99, 1, 1)

;set default to Panel1
GUISwitch($aPanel[1])
;show the main GUI
GUISetState(@SW_SHOW, $hMainGUI)

While 1
Sleep(10)
$nMsg = GUIGetMsg(1)
Switch $nMsg[1]
Case $hMainGUI
Switch $nMsg[0]
Case $GUI_EVENT_CLOSE
Exit
Case $GUI_EVENT_MINIMIZE, $GUI_EVENT_MAXIMIZE, $GUI_EVENT_RESTORE
$aPos = WinGetPos($hMainGUI)
$iW = $aPos[2]
$iH = $aPos[3]
For $i = 0 To $aPanel[0]
WinMove($aPanel[$i], "", $iLeftWidth + 2, $iT, $iW - $iLeftWidth + 2, $iH - $iT - $iB - 20)
Next
Case $aLink[1], $aLink[2], $aLink[3], $aLink[4]
For $i = 1 To $aLink[0]
If $nMsg[0] = $aLink[$i] Then
GUISetState(@SW_SHOW, $aPanel[$i])
Else
GUISetState(@SW_HIDE, $aPanel[$i])
EndIf
Next
Case $hFooter
ShellExecute("http://www.texasatmnetwork.com")
EndSwitch
Case $aPanel[2]
Switch $nMsg[0]
Case $hButton1
   $_Cmd2 = ' /k netsh int ipv4 set address name='
   $_Cmd3 = ' static '
   $_Cmd4 = ' mask='
   $_Cmd5 = ' gateway='
   ; netsh interface ipv4 set address name=Ethernet static 192.168.1.101 mask=255.255.255.0 gateway=192.168.1.1
   Run(@ComSpec & $_Cmd2 & GUICtrlRead($sInput1) & $_Cmd3 & GUICtrlRead($_Input2) & $_Cmd4 & GUICtrlRead($sInput3) & $_Cmd5 & GUICtrlRead($sInput4), '',@SW_SHOWNORMAL)
   MsgBox(32, "Test", $_Cmd2 & GUICtrlRead($sInput1) & $_Cmd3 & GUICtrlRead($_Input2) & $_Cmd4 & GUICtrlRead($sInput3) & $_Cmd5 & GUICtrlRead($sInput4))
   MsgBox(32, "Test", "NetName is " & GUICtrlRead($sInput1) & ".")
EndSwitch

Switch $nMsg[0]
Case $hButton2
   Run(@ComSpec & ' /k netsh interface ip set address ' & '"' & GUICtrlRead($sInput1) & '" dhcp', "", @SW_SHOWNORMAL)
EndSwitch

Switch $nMsg[0]
Case $hButton3
Run("rundll32.exe shell32,Control_RunDLL ncpa.cpl")
WinWait("Network Connections")
WinActivate("Network Connections")
WinWaitActive("Network Connections")
EndSwitch

Case $aPanel[4]
Switch $nMsg[0]
Case $aChkBox[1], $aChkBox[2], $aChkBox[3]
For $i = 1 To 3
If GUICtrlRead($aChkBox[$i]) = $GUI_CHECKED Then MsgBox(64, "Test", "You checked radio button" & $i & "!")
Next
EndSwitch
EndSwitch
WEnd
EndFunc ;==>_MainGui

Func _AddNewLink($sTxt, $iIcon = -44)
Local $hLink = GUICtrlCreateLabel($sTxt, 36, $iT + $iGap, $iLeftWidth - 46, 17)
GUICtrlSetCursor(-1, 0)
GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
GUICtrlCreateIcon("shell32.dll", $iIcon, 10, $iT + $iGap, 16, 16)
GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
$iGap += 22
Return $hLink
EndFunc ;==>_AddNewLink

Func _AddNewPanel($sTxt)
Local $gui = GUICreate("", $iW - $iLeftWidth + 2, $iH - $iT - $iB, $iLeftWidth + 2, $iT, $WS_CHILD + $WS_VISIBLE, -1, $hMainGUI)
GUICtrlCreateLabel($sTxt, 10, 10, $iW - $iLeftWidth - 20, 17, $SS_CENTERIMAGE)
GUICtrlSetFont(-1, 9, 800, 4, "Arial", 5)
GUICtrlSetResizing(-1, $GUI_DOCKTOP + $GUI_DOCKLEFT + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
Return $gui
EndFunc ;==>_AddNewPanel

Func _AddControlsToPanel($hPanel)
GUISwitch($hPanel)
EndFunc ;==>_AddControlsToPanel