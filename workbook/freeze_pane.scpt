use AppleScript version "2.4" -- Yosemite (10.10) or later
use scripting additions

(*
	Date: 17-12-19
	Developer: codingChewie
	Purpose: Freezes active row in Excel
	Mac OS: Sierra, version 10.12.6
	Excel: 2011, version 14.5.7
	Version: 1.1
	Name: freeze_pane.scpt
*)

set scriptName to "Freeze Pane"

tell application "Microsoft Excel"
	try
		activate workbook
		set activeBook to workbook (get name of active workbook)
		set activeSheet to worksheet (get name of active sheet) of activeBook
		select row 2 of activeSheet
		set freeze panes of active window to true
	on error error_message number error_number
		display dialog error_message with title scriptName
	end try
end tell

