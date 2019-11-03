use AppleScript version "2.4" -- Yosemite (10.10) or later
use scripting additions

(*
	Date: 18-01-30
	Developer: codingChewie
	Purpose: playing with Google Chrome
	Version: 1.1
	Name: minimize_browser.scpt
*)

on minimizeBrowser()
	with timeout of (30 * 60) seconds
		tell application "Google Chrome" to set theBrowser to window 1
		if (minimized of theBrowser) is false then set minimized of theBrowser to true
	end timeout
end minimizeBrowser

my minimizeBrowser()

