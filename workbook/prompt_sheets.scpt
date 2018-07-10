use AppleScript version "2.4" -- Yosemite (10.10) or later
use scripting additions

(*
	Date: 19-07-10
	Developer: codingChewie
	Purpose: get sheets in a prompt dialog
	Mac OS:	 Sierra, version 10.12.6
	Excel: 2011, version 14.5.7
	Version: 1.1
	Name: prompt_sheets.scpt
*)

set scriptName to "Prompt Sheets" as string

tell application "Microsoft Excel"
	try
		set allSheets to name of sheets of workbook 1
		set sheetList to {}
		repeat with theSheet in allSheets
			set sheetList to sheetList & contents of theSheet
		end repeat
		set selectedSheet to choose from list allSheets with title scriptName
		display notification selectedSheet with title scriptName
	on error error_message number error_number
		if error_number is equal to -128 then
			display notification "Script cancelled" with title scriptName
		else
			display dialog error_message with title scriptName
		end if
	end try
end tell

