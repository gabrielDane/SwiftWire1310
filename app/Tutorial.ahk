#SingleInstance, force
#Persistent
#NoEnv
#NoTrayIcon

SetTitleMatchMode, 2

; ___________________ Button in the middle of the window
SizeButBut = 120               ; Width of the button
SizeButBut /= 2               ; divide by 2
SizeWinW = 400                ; Width of the window
SizeWinW /= 2
PosButBut = %SizeWinW%        ; Position of button = 1/2 width of the window - 1/2 width of the button
PosButBut -= %SizeButBut%
;gui, add, button, x%PosButBut% w90, &Button ; Don't forget to give the width of the button (w90)


;get screen width & save as a variable
SysGet, Mon1, MonitorWorkArea 
ScreenWidth := Mon1Right - Mon1Left
TutXpos := ScreenWidth - 425 ;400 is tutorial width

;draw interface
Menu, Tray, Icon, %A_ScriptDir%\resources\images\overdrive_icons.ico


;show popup with intro and to choose yes/no to run tutorial
;clicking button sets joyVar = 1


Gui_1:
Gui 2: Destroy
Gui 1: -DPIScale +AlwaysOnTop
Gui 1:  Margin, 20, 20
Gui 1: Font, s9 bold, Arial
Gui 1: Add, Text,  w365 h28, Quick Start
Gui 1: Font, normal
Gui 1: Add, Text, y+20 w365, Welcome to SwiftWire! `n`nThis interactive tutorial will get you well on your way to building valuable automation commands.  You can re-play this lesson at any time by selecting it from the main SwiftWire app menu.
; Section - adds a row.  'ys' gets section y coordinates
;Gui 1: Add, Button, section x260 y+40 w57 h28 , Yes
Gui 1: Add, Button, y+40 w130 -gtutorialRun Default, Lets Go !
;Gui 1: Add, Button, x+10 w220 -gGui_1_3, Skip (not recommended) ;skips console for faster editing/testing
Gui 1: Add, Button, x+10 w220 -gtutorialSkip, Skip (not recommended)
Gui 1: Show, w400 , SwiftWire
return

Intro:
; 60 second interactive section to really show what SW is & does
Gui 1: Destroy
Gui 1_2: -DPIScale +AlwaysOnTop
Gui 1_2: Font, s9 bold, Arial
Gui 1_2: Add, Edit, x5 y6 w630 h360, ;was h365
Gui 1_2: Show, w640, SwiftWire Console

Sleep, 1000
Send, Initializing SwiftWire{space}
Sleep, 100
Send, .
Sleep, 100
Send, .
Sleep, 100
Send, .

Sleep, 2000
Send, {Enter}
Send, {Enter}
Send, We're excited to get you started automating your computer with ease.
Send, {Enter}
Send, {Enter}

Sleep, 3000
Send, To have SwiftWire type text for you, simply type:{space 2}
Sleep, 2000
Send, Send, This is my text
Send, {Enter}
Send, {Enter}
Sleep, 1500
Send, And, SwiftWire types ...
Send, {enter 2}
Sleep, 1500
Send, > This is my text

Sleep, 2000
Send, {Enter}
Send, {Enter}
Send, That was easy, right?{space 2}
Sleep, 1500
Send, Now, you try{!}
Send, {Enter}
Send, {Enter}
Send, >{space}
Sleep, 500

Gui +LastFound +OwnDialogs +AlwaysOnTop
;InputBox, OutputVar [, Title, Prompt, HIDE, Width, Height, X, Y, Font, Timeout, Default]
InputBox, send_text, SwiftWire,
	(
% "`nType:  `n`nSend, Hi SwiftWire"
	) , , , 
;StringReplace, NewStr, OldStr, %A_SPACE%, +, All
replaceMe := "Send, "
StringReplace, send_text_mod, send_text, %replaceMe%, , All
;activate Gui 1_2:
WinActivate, SwiftWire Console
Sleep, 1000
Send, %send_text_mod%

Sleep, 2000
;Send, {enter 2} ;not needed if do Send, {tab}{backspace}

; clear console
Send, {tab}{backspace}

Send, Nicely done.  Now, let's learn some more cool tricks.

Sleep, 2000
Send, {enter 2}
Send, To have SwiftWire press the Enter Key for you, just type:{space 2}
Sleep, 2000
Send, Send, {{}Enter{}}
Sleep, 1500

Send, {Enter}
Send, {Enter}
Send, And, SwiftWire presses Enter...
Sleep, 2000
Send, {enter 2}
Send, >{space} ;Enter+{left 5}
Sleep, 1500
Send, {enter}
Send, >{space}

Sleep, 1500
InputBox, send_keys, SwiftWire,
	(
% "This can be done with other keys as well.  You can even string more than one step together.  Let's have some fun!  `n`nType:  `nSend, {up} Multiple {down} Steps"
	) , , , 
;StringReplace, NewStr, OldStr, %A_SPACE%, +, All
replaceMe := "Send, "
StringReplace, send_keys_mod, send_keys, %replaceMe%, , All
Sleep, 1000
WinActivate, SwiftWire Console
Send, %send_keys_mod%

Sleep, 2000
Send, {enter 2}
Send, Fantastic.{space 2}
Sleep, 1000
Send, We knew you could do it{!}  
sleep, 3000
Gosub, Gui_1_3
return

Gui_1_3:
Gui 2: Destroy
Gui 1_3: -DPIScale +AlwaysOnTop
Gui 1_3: Margin, 20, 20
Gui 1_3: Font, s9 bold, Arial
;Gui 1_3: Add, Text,  w365 h28 , Congratulations! 
;Gui 1_3: Font, normal
Gui 1_3: Add, Text, y+20 w365, You have just learned the most important fundamentals about how SwiftWire works.  
;Gui 1_3: Font, bold
;Gui 1_3: Add, Text, w365, Any repetitive task on your computer can now be automated.
Gui 1_3: Font, normal
Gui 1_3: Add, Text, w365, Now, let's get oriented to the SwiftWire app and go build a command together.
Gui 1_3: Add, Button, x%PosButBut% y+40 w120 h28 -gGui_2 Default, Continue ...
Gui 1_3: Show, w400 , SwiftWire
return

Gui_2:
Gui 1_2: Destroy ;leave console open jus a little longer - moved this here
Gui 1_3: Destroy
Gui 3: Destroy
Gui 2: -DPIScale +AlwaysOnTop
Gui 2:  Margin, 20, 20
Gui 2: Font, s9 bold, Arial
Gui 2: Add, Text,  w365 h28 , Quick Start
Gui 2: Font, normal
Gui 2: Add, Text, y+20 w365, At the top of the screen you will see the SwiftWire app toolbar.`n`nThis toolbar is where to find the main SwiftWire menu, located by clicking on the word "SwiftWire" on the top left.  To the right of this menu you will see customizable categories.  These categories are where you find all of your automation commands that can be run with `'1-click`'. `n`nThere are several pre-made commands located in the toolbar that we'll explain a little later.  Click 'Next' when you are ready to continue.   
; Section - adds a row.  'ys' gets section y coordinates
Gui 2: Add, Button, section x260 y+40 w57 h28 -gGui_1_3, Back
Gui 2: Add, Button, x325 ys w57 h28 -gGui_3 Default, Next
Gui 2: Show, w400 , SwiftWire
return

Gui_3:
Gui 2: Destroy
Gui 4: Destroy
Gui 3: -DPIScale +AlwaysOnTop
Gui 3:  Margin, 20, 20
Gui 3: Font, s9 bold, Arial
Gui 3: Add, Text,  w365 h28 , Quick Start
Gui 3: Font, normal
Gui 3: Add, Text, y+20 w365, Now that you have the lay of the land, please open EPIC and navigate to an encounter on a test patient (We generally use a 'Counseling' type encounter on a patient whose last name starts with "Zzz").  `n`nWhen you have done this and are ready to continue, click 'Next'.  
; Section - adds a row.  'ys' gets section y coordinates
Gui 3: Add, Button, section x260 y+40 w57 h28 -gGui_2, Back
Gui 3: Add, Button, x325 ys w57 h28 gGui_4 Default, Next
Gui 3: Show, w400 x%TutXpos% y40, SwiftWire
return

Gui_4:
Gui 3: Destroy
Gui 5: Destroy
Gui 4: -DPIScale +AlwaysOnTop
Gui 4:  Margin, 20, 20
Gui 4: Font, s9 bold, Arial
Gui 4: Add, Text,  w365 h28 , Important Efficiency Note: 
Gui 4: Font, normal
Gui 4: Add, Text, y+20 w365,  A big key to success with SwiftWire is to learn about "Hotkeys".  "Hotkeys" unlock massive efficiency potential when used effectively.  `n`nA reference of "Hotkeys" available in EPIC can be found by scrolling to the very bottom of the patient charting section in Visit Navigator.  You will see a little blue button with a question mark in it.  Click on it to see the "Hotkey" reference at anytime. `n`nWhen you are done checking out the "Hotkeys", click 'Close' on the popup. 
; Section - adds a row.  'ys' gets section y coordinates
Gui 4: Add, Button, section x260 y+40 w57 h28 -gGui_3, Back
Gui 4: Add, Button, x325 ys w57 h28 -gGui_5 Default, Next
Gui 4: Show, w400 x%TutXpos% y40, SwiftWire
return

Gui_5:
Gui 4: Destroy
Gui 6: Destroy
Gui 5: -DPIScale +AlwaysOnTop
Gui 5:  Margin, 20, 20
Gui 5: Font, s9 bold, Arial
Gui 5: Add, Text,  w365 h28 , Quick Start
Gui 5: Font, normal
Gui 5: Add, Text, y+20 w365, Once you can see the Visit Navigator screen in EPIC, navigate to the Order Entry screen `n`n(Press The 'Control key' + the letter 'o' on most systems).  `n`nClick on the SwiftWire menu on the top left of the screen, and then click on 'Command Builder'. 
; Section - adds a row.  'ys' gets section y coordinates
Gui 5: Add, Button, section x260 y+40 w57 h28 -gGui_4, Back
Gui 5: Add, Button, x325 ys w57 h28 -gGui_6 Default, Next
Gui 5: Show, w400 x%TutXpos% y40, SwiftWire
WinActivate, Hyperspace
return

Gui_6:
Gui 5: Destroy
Gui 6_5: Destroy
Gui 6: -DPIScale +AlwaysOnTop
Gui 6:  Margin, 20, 20
Gui 6: Font, s9 bold, Arial
Gui 6: Add, Text,  w365 h28 , Quick Start
Gui 6: Font, normal
Gui 6: Add, Text, y+20 w365, This is Command Builder, and the real power behind SwiftWire.  Don't get intimidated, it's actually quite simple.  `n`nThis is where you will build, update, and organize all of your automation commands.
; Section - adds a row.  'ys' gets section y coordinates
Gui 6: Add, Button, section x260 y+40 w57 h28 -gGui_5, Back
Gui 6: Add, Button, x325 ys w57 h28 -gGui_6_5 Default, Next
Gui 6: Show, w400 x%TutXpos% y40, SwiftWire
return

Gui_6_5:
Gui 6: Destroy
Gui 6_7: Destroy
Gui 6_5: -DPIScale +AlwaysOnTop
Gui 6_5:  Margin, 20, 20
Gui 6_5: Font, s9 bold, Arial
Gui 6_5: Add, Text,  w365 h28 , Quick Start
Gui 6_5: Font, normal
Gui 6_5: Add, Text, y+20 w365, Let's make our own lab order together.  We are going to have SwiftWire order a CBC and CMP in a simple example:  `n`nFirst, double-click the 'Lab Orders' folder to expand the folder and show its' contents.  Now, click the 'New Command' button.  `n`nType 'CBC and CMP' in the box, and click 'OK'.  You have just created a blank command.  Next, click on the newly created 'CBC and CMP' command to select it and open it for editing. 
; Section - adds a row.  'ys' gets section y coordinates
Gui 6_5: Add, Button, section x260 y+40 w57 h28 -gGui_6, Back
Gui 6_5: Add, Button, x325 ys w57 h28 -gGui_6_7 Default, Next
Gui 6_5: Show, w400 x%TutXpos% y40, SwiftWire
return

/*
Gui_6_6:
Gui 6_5: Destroy
Gui 6_7: Destroy
Gui 6_6: -DPIScale +AlwaysOnTop
Gui 6_6:  Margin, 20, 20
Gui 6_6: Font, s9 bold, Arial
Gui 6_6: Add, Text,  w365 h28 , Quick Start
Gui 6_6: Font, normal
Gui 6_6: Add, Text, y+20 w365, When making commands in SwiftWire you have to speak "Computer Language",  which is actually simpler than it sounds.  There are only 5 things that you can tell your keyboard to do.  All your commands will be in this format.`n`nTelling your keyboard to type something like "hello" looks like this:
Gui 6_6: Font, bold
Gui 6_6: Add, Text, w365, Send, hello
Gui 6_6: Font, normal
Gui 6_6: Add, Text, w365, That's it.  By starting the command with "Send, " the keyboard will do what you tell it to.
; Section - adds a row.  'ys' gets section y coordinates
Gui 6_6: Add, Button, section x260 y+40 w57 h28 -gGui_6_5, Back
Gui 6_6: Add, Button, x325 ys w57 h28 -gGui_6_7 Default, Next
Gui 6_6: Show, w400 x%TutXpos% y40, SwiftWire
return
*/

Gui_6_7:
Gui 6_5: Destroy
Gui 6_8: Destroy
Gui 6_7: -DPIScale +AlwaysOnTop
Gui 6_7:  Margin, 20, 20
Gui 6_7: Font, s9 bold, Arial
Gui 6_7: Add, Text,  w365 h28 , Quick Start
Gui 6_7: Font, normal
Gui 6_7: Add, Text, y+20 w365, Before we build our command, let's review some basics.  To have SwiftWire press the 'Enter' key, or the 'Tab' key or the 'Down Arrow' key, looks like this:
Gui 6_7: Font, bold
Gui 6_7: Add, Text, w365, Send, {enter}`n`nSend, {tab}`n`nSend, {down}
Gui 6_7: Font, normal
;Gui 6_7: Add, Text, w365, Click 'Next' to continue.
; Section - adds a row.  'ys' gets section y coordinates
Gui 6_7: Add, Button, section x260 y+40 w57 h28 -gGui_6_5, Back
Gui 6_7: Add, Button, x325 ys w57 h28 -gGui_6_8 Default, Next
Gui 6_7: Show, w400 x%TutXpos% y40, SwiftWire
return

Gui_6_8:
Gui 6_7: Destroy
Gui 7: Destroy
Gui 6_8: -DPIScale +AlwaysOnTop
Gui 6_8:  Margin, 20, 20
Gui 6_8: Font, s9 bold, Arial
Gui 6_8: Add, Text,  w365 h28 , Quick Start
Gui 6_8: Font, normal
Gui 6_8: Add, Text, w365, For the specialty keys like the 'Control' key, the 'Alt' key and the 'Shift' key, there are short-cuts that are much easier than typing them out.  The short-cuts are as follows:
Gui 6_8: Font, bold
Gui 6_8: Add, Text, w365,Control key = the '^' (found over the Number 6)`n`nAlt key = the '!' character`n`nShift key = the '+' character
Gui 6_8: Font, normal
Gui 6_8: Add, Text, w365, So, to tell SwiftWire to press the 'Control' and 'o' keys to open Order Entry looks like this:
Gui 6_8: Font, bold
Gui 6_8: Add, Text, w365, Send, ^o
Gui 6_8: Font, normal
Gui 6_8: Add, Text, w365, There is a helpful reference section in Command Builder to remind you of the short-cuts && how to build everything you will need in SwiftWire.
; Section - adds a row.  'ys' gets section y coordinates
Gui 6_8: Add, Button, section x260 y+40 w57 h28 -gGui_6_7, Back
Gui 6_8: Add, Button, x325 ys w57 h28 -gGui_7 Default, Next
Gui 6_8: Show, w400 x%TutXpos% y40, SwiftWire
return

Gui_7:
Gui 6_8: Destroy
Gui 8: Destroy
Gui 7: -DPIScale +AlwaysOnTop
Gui 7:  Margin, 20, 20
Gui 7: Font, s9 bold, Arial
Gui 7: Add, Text,  w365 h28 , Quick Start
Gui 7: Font, normal
Gui 7: Add, Text, y+20 w365, Great!  We are ready to tell SwiftWire what we want it to do to control EPIC.  To order our example CBC and CMP, your keyboard will have to do this: `n`n`n1.  Press the 'Alt' key + the letter 'w' to start a new order`n`n2.  Type CBC `n`n3.  Press the 'Enter' key`n`n4.  Press the 'Enter' key again`n`n5.  Type CMP `n`n6.  Press the 'Enter' key`n`n7.  Press the 'Enter' key one last time.`n`n`nFrom what you have learned, challenge yourself to write what you think the command should look like in the Command Content editing area now.  `n`nWhen it looks right, click 'Next' to see the solution. 

; Section - adds a row.  'ys' gets section y coordinates
Gui 7: Add, Button, section x260 y+40 w57 h28 -gGui_6_8, Back
Gui 7: Add, Button, x325 ys w57 h28 -gGui_8 Default, Next
Gui 7: Show, w400 x%TutXpos% y40, SwiftWire
return

Gui_8:
Gui 7: Destroy
Gui 9: Destroy
Gui 8: -DPIScale +AlwaysOnTop
Gui 8:  Margin, 20, 20
Gui 8: Font, s9 bold, Arial
Gui 8: Add, Text,  w365 h28 , Quick Start
Gui 8: Font, normal
Gui 8: Add, Text, y+20 w365, Does your command look like this? 

Gui 8: Font, Bold
Gui 8: Add, Text, w365, Send, !w `n`nSend, cbc `n`nSend, {enter} `n`nSend, {enter} `n`nSend, cmp `n`nSend, {enter} `n`nSend, {enter} 

Gui 8: Font, Normal
Gui 8: Add, Text, w365, When it does, click 'Save', and then click 'Ok'.  `n`nClick 'Next' to continue...  You are almost there!

; Section - adds a row.  'ys' gets section y coordinates
Gui 8: Add, Button, section x260 y+40 w57 h28 -gGui_7, Back
Gui 8: Add, Button, x325 ys w57 h28 -gGui_9 Default, Next
Gui 8: Show, w400 x%TutXpos% y40, SwiftWire
return

Gui_9:
Gui 8: Destroy
Gui 10: Destroy
Gui 9: -DPIScale +AlwaysOnTop
Gui 9:  Margin, 20, 20
Gui 9: Font, s9 bold, Arial
Gui 9: Add, Text,  w365 h28 , Quick Start
Gui 9: Font, normal
Gui 9: Add, Text, y+20 w365, Now, let's test it.  Make sure EPIC is still open with your test patient encounter, and you are still on the Order Entry screen.  If so, you can now click the 'Lab Orders' drop-down on the SwiftWire toolbar.  Notice our newly created command, 'CBC and CMP'.  `n`nClick on it... 
; Section - adds a row.  'ys' gets section y coordinates
Gui 9: Add, Button, section x260 y+40 w57 h28 -gGui_8, Back
Gui 9: Add, Button, x325 ys w57 h28 -gGui_10 Default, Next
Gui 9: Show, w400 x%TutXpos% y40, SwiftWire
WinActivate, Hyperspace
return

Gui_10:
Gui 9: Destroy
Gui 11: Destroy
Gui 10: -DPIScale +AlwaysOnTop
Gui 10:  Margin, 20, 20
Gui 10: Font, s9 bold, Arial
Gui 10: Add, Text,  w365 h28 , Quick Start
Gui 10: Font, normal
Gui 10: Add, Text, y+20 w365, Congratulations, you have just successfully built and run your first SwiftWire command!
Gui 10: Font, bold
Gui 10: Add, Text, w365, Any repetitive task in your EMR can now be automated!
Gui 10: Font, normal
Gui 10: Add, Text, w365, Look for support documentation (including FAQ's) in the Help section found under the SwiftWire main menu.  There is also a link to re-play this tutorial at any time. 
; Section - adds a row.  'ys' gets section y coordinates
Gui 10: Add, Button, section x260 y+40 w57 h28 -gGui_9, Back
Gui 10: Add, Button, x325 ys w57 h28 -gGui_11 Default, Next
Gui 10: Show, w400 x%TutXpos% y40, SwiftWire
return

Gui_11:
Gui 10: Destroy
Gui 12: Destroy
Gui 11: -DPIScale +AlwaysOnTop
Gui 11:  Margin, 20, 20
Gui 11: Font, s9 bold, Arial
Gui 11: Add, Text,  w365 h28 , Thank you for using SwiftWire!
Gui 11: Font, normal
Gui 11: Add, Text, y+20 w365, We appreciate your download, and have spent countless hours of passion and care to bring you the best product we can.  `n`nWe hope you will consider joining our on-line forums where we can work together to solve challenges and share our most useful SwiftWire commands.  `n`nWe want to hear from you.  Please contact us with any questions, suggestions, && feedback.  We are driven to make this app as excellent as it can be, so that you can spend your time practicing great medicine.`n`nKind Regards,`nKirk Crews, MD && Gabe Charbonneau, MD`nCo-Founders of Fluent Systems, Inc.
; Section - adds a row.  'ys' gets section y coordinates
Gui 11: Add, Button, section x260 y+40 w57 h28 -gGui_10, Back
Gui 11: Add, Button, x325 ys w57 h28 -gGuiClose Default, Done
Gui 11: Show, w400 x%TutXpos% y40, SwiftWire
return

tutorialRun:
FileDelete, %A_ScriptDir%\resources\scripts\joy.dat
FileAppend, 1,%A_ScriptDir%\resources\scripts\joy.dat
Gosub, Intro
return

tutorialSkip:
FileDelete, %A_ScriptDir%\resources\scripts\joy.dat
FileAppend, 1,%A_ScriptDir%\resources\scripts\joy.dat
ExitApp
return

;GuiClose - click the X (hypothesis -gdc)
GuiClose:
ExitApp