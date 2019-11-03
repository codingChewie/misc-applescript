use AppleScript version "2.4" -- Yosemite (10.10) or later
use scripting additions

(*
	Date: 18-01-30
	Developer: codingChewie
	Purpose: playing with Google Chrome
	Version: 1.1
	Name: browser_title.scpt
*)

on browserTitle()
	with timeout of (30 * 60) seconds
		tell application "Google Chrome" to set browserTitle to title of active tab of front window & return
	end timeout
end browserTitle

my browserTitle()

