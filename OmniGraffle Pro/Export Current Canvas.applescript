(*
 * Export Current Canvas as PDF
 * a script for OmniGraffle
 * Copyright (C) 2009,2010,2011,2012 by Takuo Watanabe
 *)

property fileExt : ".pdf"
property useDocName : true
property docNameSep : "_"
property generateBB : true

on run
	tell application "OmniGraffle Professional 5"
		set doc to first document
		set dpath to path of doc as POSIX file as alias
		tell application "Finder" to set ofolder to POSIX path of (folder of dpath as alias)
		set prefix to mkPrefix(doc) of me
		set cname to name of canvas of first window as text
		set ofile to (ofolder & prefix & cname & fileExt) as POSIX file as text
		save doc in file ofile
		if generateBB then
			tell me to do shell script ("/usr/texbin/extractbb " & (POSIX path of ofile))
		end if
	end tell
end run

on mkPrefix(doc)
	set prefix to ""
	if useDocName then
		set dname to name of doc
		if dname ends with ".graffle" then
			set dname to text 1 thru -9 of dname
		end if
		set prefix to dname & docNameSep
	end if
	return prefix
end mkPrefix
