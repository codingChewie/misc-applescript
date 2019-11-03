use AppleScript version "2.4" -- Yosemite (10.10) or later
use scripting additions

(*
	Date: 17-12-19
	Developer: codingChewie
	Purpose: Notify each worksheet in an Excel Workbook
	Mac OS: Sierra, version 10.12.6
	Excel: 2011, version 14.5.7
	Version: 1.1
	Name: worksheet_notification.scpt
*)

set scriptName to "Worksheet Notification"

tell application "Microsoft Excel"
	try
		activate workbook
		set activeBook to workbook (get name of active workbook)
		set sheetCount to count of sheets of activeBook
		repeat with eachSheet from 0 to sheetCount
			activate object worksheet eachSheet
			set sheetName to (name of worksheet eachSheet of activeBook) as text
			display notification sheetName with title scriptName
			delay 1
		end repeat
	on error error_message number error_number
		display dialog error_message with title scriptName
	end try
end tell

