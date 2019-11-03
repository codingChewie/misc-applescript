use AppleScript version "2.4" -- Yosemite (10.10) or later
use scripting additions

(*
	Date: 17-12-19
	Developer: codingChewie
	Purpose: Identify the first empty row in a column
	Mac OS: Sierra, version 10.12.6
	Excel: 2011, version 14.5.7
	Version: 1.1
	Name: first_empty_row.scpt
*)

set scriptName to "Empty Row" as string
set columnNumber to 1 as integer

tell application "Microsoft Excel"
	try
		activate workbook
		set activeBook to workbook (get name of active workbook)
		set activeSheet to worksheet (get name of active sheet) of activeBook
		set lastRow to (first row index of (get end (last cell of column columnNumber) direction toward the top) of activeSheet) as string
		tell application "Finder" to display dialog ("In worksheet \"" & (name of activeSheet) & "\" the last row is: " & lastRow) with title scriptName
	on error error_message number error_number
		if error_number is equal to -128 then
			display notification "Script cancelled" with title scriptName
		else
			display dialog error_message with title scriptName
		end if
	end try
end tell

