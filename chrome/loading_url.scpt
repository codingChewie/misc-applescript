use AppleScript version "2.4" -- Yosemite (10.10) or later
use scripting additions

(*
	Date: 18-01-30
	Developer: codingChewie
	Purpose: playing with Google Chrome
	Version: 1.1
	Name: loading_url.scpt
*)

set testURL to "https://stackoverflow.com/"

on loadingURL(testURL)
	with timeout of (30 * 60) seconds
		tell application "Google Chrome"
			set theWindow to window 1
			set goTo to make new tab at end of tab of theWindow
			set URL of goTo to testURL
			repeat until loading of goTo is "false"
				display notification "Loading URL:" & testURL
				delay 0.5
				if loading of goTo is true then exit repeat
			end repeat
			delay 1
			return "loaded"
		end tell
	end timeout
end loadingURL

my loadingURL(testURL)

