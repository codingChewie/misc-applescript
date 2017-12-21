use AppleScript version "2.4" -- Yosemite (10.10) or later
use scripting additions

(*
	Date:			17-12-21
	Developer:		codingChewie
	Purpose:		Will hide or unhide columns through a handler
	Mac OS:			Sierra, version 10.12.6
	Excel:			2011, version 14.5.7
	Version:		1.1
	Name:			hide_unhide_column.scpt
*)

set scriptName to " Hide/Unhide Columns"

on columnHandler(task, columns)
	try
		if task is not equal to "hide" and task is not equal to "unhide" then
			display notification "Incorrect task: \"" & task & "\", script cancelled"
			error number -128
		end if
		if class of columns ≠ list then
			display notification "Incorrect columns: \"" & (list as string) & "\", script cancelled"
			error number -128
		end if
		tell application "Microsoft Excel"
			activate workbook
			set activeBook to workbook (get name of active workbook)
			set activeSheet to worksheet (get name of active sheet) of activeBook
			## set screen updating to true
		end tell
		repeat with theColumn in columns
			tell application "Microsoft Excel"
				if task = "hide" then
					set hidden of (entire column of (range theColumn)) to true
				else if task = "unhide" then
					set hidden of (entire column of (range theColumn)) to false
				end if
			end tell
		end repeat
	on error error_message number error_number
		if error_number is equal to -128 then
			display notification "Script cancelled" with title scriptName
		else
			display dialog error_message with title scriptName
		end if
	end try
end columnHandler

## hide column
my columnHandler("hide", {"A:B", "E:E"})

## unhide column
## my columnHandler("uhide", {"A:A", "B:B"})
