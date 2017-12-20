use AppleScript version "2.4" -- Yosemite (10.10) or later
use scripting additions

(*
	Date:			17-12-20
	Developer:		codingChewie
	Purpose:		remove all borders in a worksheet
	Mac OS:			Sierra, version 10.12.6
	Excel:			2011, version 14.5.7
	Version:		1.1
	Name:			remove_borders.scpt
*)

set scriptName to "Remove Borders" as string

tell application "Microsoft Excel"
	try
		activate workbook
		set activeBook to workbook (get name of active workbook)
		set activeSheet to worksheet (get name of active sheet) of activeBook
		set usedRange to used range of activeSheet
		set myBorders to {border top, border bottom, border left, border right}
		repeat with i from 1 to 4
			set theBorder to get border usedRange which border (item i of myBorders)
			set line style of theBorder to line style none
		end repeat
	on error error_message number error_number
		display dialog error_message with title scriptName
	end try
end tell
