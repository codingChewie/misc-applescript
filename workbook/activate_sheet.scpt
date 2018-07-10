use AppleScript version "2.4" -- Yosemite (10.10) or later
use scripting additions

(*
	Date: 19-07-10
	Developer: codingChewie
	Purpose: activates the sheet chosen by a prompt
	Mac OS:	 Sierra, version 10.12.6
	Excel: 2011, version 14.5.7
	Version: 1.1
	Name: activate_sheet.scpt
*)

set scriptName to "Activate Sheet" as string

tell application "Microsoft Excel"
	activate
	try
		tell workbook 1
			set allSheets to name of sheets
			set sheetList to {}
			repeat with theSheet in allSheets
				set sheetList to sheetList & contents of theSheet
			end repeat
			set selectedSheet to choose from list allSheets with title scriptName
			activate object worksheet (selectedSheet as text)
		end tell
	on error error_message number error_number
		if error_number is equal to -128 then
			display notification "Script cancelled" with title scriptName
		else
			display dialog error_message with title scriptName
		end if
	end try
end tell

