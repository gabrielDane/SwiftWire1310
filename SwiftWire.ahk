/* 
	SWIFTWIRE - Desktop Automation Software
  	Copyright 2017, Fluent Systems, Inc. 
 */

; !!! NEED CODE TO LAUNCH TUTORIAL ON FIRST RUN !!! - 112317 gdc
; Do this once NEW tutorial is built 


#SingleInstance, Force
; set tray icon
Menu, Tray, Icon, %A_ScriptDir%\app\resources\images\overdrive_icons.ico

SetWorkingDir %A_ScriptDir%\app\

; splash image code
SplashImage, %A_ScriptDir%\app\resources\images\splash_logo.jpg, b fs10,
Sleep, 3000
SplashImage, Off

Run %A_ScriptDir%\app\Booster.exe bar_prep.ahk



/*
	Insert new tutorial code here - 112317 gdc
*/


ExitApp