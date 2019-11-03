use AppleScript version "2.4" -- Yosemite (10.10) or later
use scripting additions

(*
	Date: 19-02-17
	Developer: codingChewie
	Purpose: install MongoDB on a Mac
	Mac OS:	 Sierra, version 10.12.6
	Version: 1.1
	Name: mongodb-installer.app
*)

global usrBin, binArray, mongoVersion

set scriptName to "MongoDB Installer"
set usrBin to "/usr/local/bin/"
set mongoVersion to "mongodb-osx-x86_64-4.0.6"
set binArray to {}

if mongoExistance() = true then
	set goMongo to display dialog "MongoDB was found in \"" & usrBin & "\" would you still like to install?" buttons {"yes", "no"} default button "no" giving up after 10 with title scriptName
	if button returned of goMongo = "yes" then my mongoInstaller()
end if

if mongoExistance() = true then
	try
		set dataExist to false
		set dataDir to "data/db"
		tell application "Finder" to if exists (dataDir) as POSIX file then set dataExist to true
		if dataExist = true then
			return true
		else
			set createData to "sudo /bin/mkdir -p /data/db/ && sudo chmod 777 /data && sudo chmod 777 /data/db"
			do shell script createData with administrator privileges
		end if
	on error error_message number error_number
		if error_number is equal to -128 then
			display notification "Script was cancelled" with title scriptName
		else
			display alert error_message
		end if
	end try
end if

return display notification "MongoDB install completed" with title scriptName

on mongoInstaller()
	try
		set binApp to alias ((path to me as text) & "Contents:Resources:" & mongoVersion & ":bin:") as text
		tell application "Finder" to set the binArray to list folder binApp with invisibles
		## return binArray
	on error error_message
		return display alert "ERROR: " & error_message
	end try
	try
		repeat with theItem in binArray
			set shellCommand to "cp " & quoted form of (POSIX path of binApp & contents of theItem) & " " & quoted form of usrBin
			set result to do shell script shellCommand with administrator privileges
			return result
		end repeat
	on error result
		display alert result
	end try
end mongoInstaller

on mongoExistance()
	set mongoExists to false
	tell application "Finder" to if exists (usrBin & "mongod") as POSIX file then set mongoExists to true
end mongoExistance

