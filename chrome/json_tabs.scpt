use AppleScript version "2.4" -- Yosemite (10.10) or later
use scripting additions

(*
	Date: 18-01-30
	Developer: codingChewie
	Purpose: takes the id and url then returns those in a JSON format
	Version: 1.1
	Name: json_tabs.scpt
*)

on whatTabs()
	with timeout of (30 * 60) seconds
		set stringTabs to "["
		set listCount to 0
		tell application "Google Chrome"
			set activeTabs to tabs of window 1
			repeat with theTab in activeTabs
				set listCount to listCount + 1
				set totalCount to get count of activeTabs
				set stringTabs to stringTabs & "{\"id\":\"" & (id of theTab) & "\"},{\"url\":\"" & (URL of theTab) & "\"}"
				if listCount ≠ totalCount then
					set stringTabs to stringTabs & ","
				end if
			end repeat
			set stringTabs to stringTabs & "]"
		end tell
		return stringTabs
	end timeout
end whatTabs

my whatTabs()

