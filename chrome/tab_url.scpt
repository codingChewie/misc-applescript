use AppleScript version "2.4" -- Yosemite (10.10) or later
use scripting additions

(*
	Date: 18-01-30
	Developer: codingChewie
	Purpose: playing with Google Chrome
	Version: 1.1
	Name: tab_url.scpt
*)

set testURL to "https://stackoverflow.com/"

on tabURL(testURL)
	with timeout of (30 * 60) seconds
		tell application "Google Chrome"
			set theWindow to window 1
			set goTo to make new tab at end of tab of theWindow
			set URL of goTo to testURL
		end tell
	end timeout
end tabURL

my tabURL(testURL)

