use AppleScript version "2.4" -- Yosemite (10.10) or later
use scripting additions

(*
	Date: 18-06-07
	Developer: codingChewie
	Purpose: converts XLSX to CSV
	Mac OS: Sierra, version 10.12.6
	Excel: 2011, version 14.5.7
	Version: 1.1
	Name: xlsx_to_csv.scpt
*)

set fileType to "XLSX" as text
set theDocument to choose file with prompt "Please choose " & fileType & " files:" of type {fileType}
set filepath to characters 1 thru -6 of (theDocument as text) as text
tell application "Microsoft Excel"
	open theDocument
	tell workbook 1
		tell sheet 1
			save in (filepath & ".csv") as CSV file format
		end tell
		close without saving
	end tell
end tell

