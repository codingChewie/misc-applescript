use AppleScript version "2.4" -- Yosemite (10.10) or later
use scripting additions

(*
	Date: 19-07-10
	Developer: codingChewie
	Purpose: set bounds of a workbook
	Mac OS:	 Sierra, version 10.12.6
	Excel: 2011, version 14.5.7
	Version: 1.1
	Name: set_bounds.scpt
*)

tell application "Microsoft Excel"
	set leftHorizon to 0 as integer ## left-most horizontal
	set topVert to 25 as integer ## top vertical
	set rightMost to 1000 as integer ## right-most horizontal
	set bottomVert to 500 as integer ## bottom vertical
	set bounds of windows of workbook 1 to {leftHorizon, topVert, rightMost, bottomVert}
end tell

