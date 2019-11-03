use AppleScript version "2.4" -- Yosemite (10.10) or later
use scripting additions

(*
	Date: 18-01-30
	Developer: codingChewie
	Purpose: playing with Google Chrome
	Version: 1.1
	Name: browser_minimzed.scpt
*)

set testURL to "https://stackoverflow.com/"

on browserMinimized()
	with timeout of (30 * 60) seconds
		tell application "Google Chrome"
			set theWindow to window 1
			if theWindow is minimized then
				return true
			else
				return false
			end if
		end tell
	end timeout
end browserMinimized

my browserMinimized()

