use AppleScript version "2.4" -- Yosemite (10.10) or later
use scripting additions

set f to choose file with prompt "Select a spreadsheet to replace with"

tell application "Numbers"
	open f
	set rs to 1
	tell document 1
		tell active sheet
			tell table 1
				repeat row count times
					if cell ("A" & rs as text)'s value is missing value then
						exit repeat
					end if
					set a to value of cell ("A" & rs as text)
					set b to value of cell ("B" & rs as text)
					tell me to replace from a to b
					set rs to rs + 1
				end repeat
			end tell
		end tell
	end tell
end tell

to replace from fi to re
	tell application "BBEdit"
		set res to find fi searching in text 1 of text document 1 with selecting match
		if res's found then
			set text 1 of text document 1 to grep substitution of re
		end if
	end tell
end replace