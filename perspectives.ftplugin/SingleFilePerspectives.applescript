property pTargetApp : "FoldingText"
property pTitle : "Custom perspectives for " & pTargetApp
property pVer : "0.09"
-- Author Rob Trew, license MIT
-- Provisional version -- refactoring to 1. check and report on plugin installation
-- and 2. call plugin functions directly (rather than invoke a command and set a global)

property pstrDefaultCollection : "$HOME/Library/Application Support/Notational Velocity"
property pstrDefaultCollectionMask : "project *"

property pblnFrontMatter : true

property pViewFolder : "ViewFolder" -- Name for Perspectives folder to be created in same folder as .ft doc (e.g. nvAlt folder)
property pstrTitlePrefix : "## "
property pblnIncludeQueryComment : true

property pblnDebug : false
property pblnInMarked : true

property pstrMenuFile : "ViewMenu.json"

property pstrViewFolder : "$HOME/Library/Application\\ Support/Notational\\ Velocity/ViewFolder"

property pstrEditQuery : "Edit Query in FT"
property pstrViewInMarked : "View in Marked"
property pstrLine : "____________________________________________"
property lstSubMenu : {"View in Marked", pstrLine, "Open Report in FT", pstrEditQuery, pstrLine, "Copy Report", "Copy Query", "Copy Both", pstrLine, "Email"}

-- THIS SCRIPT REQUIRES up to date versions of TWO PLUGINS TO BE INSTALLED
-- (a dialog will prompt for any plugin which needs to be installed or upgraded)
property pstrRTPluginFolder : "FoldingText 2 plugins and scripts"
property pRTPluginLink : "https://github.com/RobTrew/tree-tools"
property plstPlugins : {{|name|:"perspectives", |version|:0.1, |URL|:pRTPluginLink, |folder|:pstrRTPluginFolder}}
property piPerspectives : 1

-- 1. COPY THE FOLLOWING PLUGIN FOLDER AND ITS CONTENTS TO THE  FOLDINGTEXT PLUG-IN DIRECTORY
-- ( From the FoldingText menu: File > Open Application Folder )

----- reminder tools.ftplugin

-- (this .ftplugin plugin folder can be found at
-- https://github.com/RobTrew/tree-tools/tree/master/FoldingText%202%20plugins%20and%20scripts
-- Download https://github.com/RobTrew/tree-tools/archive/master.zip
-- Unzip the archive, and copy the .ftplugin folder from:
--	--	-- tree-tools-master/FoldingText 2 plugin and scripts
-- into the FT Application folder's Plug-ins subfolder.
--)

-- CLOSE & RESTART FoldingText 2

property pjsGetCustomMenu : "customMenu(options.menujson)"
property pjsGetDefaultsJSON : "defaultsJSON()"
property pjsGetJSONByName : "customJSONByName(editor, options.viewname)"
property pjsGetCustomViewByName : "customViewByName(editor, options)"

on run
	-- CHOOSE AND VIEW A CUSTOM PERSPECTIVE / REPORT (IN MARKED2.APP OR A 2ND FoldingText DOCUMENT)
	set strPath to POSIX path of (path to me)
	tell application "FoldingText"
		set oApp to it
		set lstDocs to documents
		if lstDocs ≠ {} then
			tell item 1 of lstDocs
				-- DO WE HAVE THE PLUGINS WHICH WE NEED ?
				set lstloadedPlugins to my loadedPlugins(it)
				set lstMissing to {}
				repeat with i from 1 to length of plstPlugins
					set varPath to contents of (item i of lstloadedPlugins)
					if class of (varPath) is not text then -- Null, or an earlier version *number* in lieu of a path
						set end of lstMissing to ((item i of plstPlugins) & {problem:varPath})
					end if
				end repeat
				
				if lstMissing ≠ {} then
					my pointUserToPlugins(lstMissing)
				else
					-- OFFER A CHOICE OF REPORTS
					set strViewPlugin to item piPerspectives of lstloadedPlugins
					set strFileName to name of it
					try
						set strFilePath to POSIX path of ((file of it) as alias)
					on error
						activate
						display dialog "Front document  '" & strFileName & "'  not yet saved ..." buttons {"OK"} default button "OK" with title pTitle & "  ver. " & pVer
						return
					end try
					set lstPackList to [strFilePath, 0, 0] -- source file, startChar, startLine (multi-file reports (see CLI version) have longer packlists)
					
					if pblnDebug then
						set recMenu to (debug script my fnCall(pjsGetMenu) with options {pluginPath:strViewPlugin})
					else
						-- LOOK FOR MENU FILE
						set strMenuPath to my GetMenuPath()
						set strJSON to my GetJson(strMenuPath)
						if strJSON = "" then
							-- IF A MENU FILE IS NOT FOUND, GET THE DEFAULT MENU FROM THE PLUGIN
							--set lstMenu to (evaluate script pjsGetMenu with options {pluginPath:strViewPlugin})
							set strJSON to (evaluate script my fnCall(pjsGetDefaultsJSON) with options {pluginPath:strViewPlugin})
							--tell application "Finder" to set the clipboard to strJSON
							my WriteText2Path(strJSON, strMenuPath)
						end if
						
						set lstMenu to (evaluate script my fnCall(pjsGetCustomMenu) with options {pluginPath:strViewPlugin, menujson:strJSON})
						
					end if
					-- AND DISPLAY A CHOICE
					
					
					set strViewTitle to choose from list lstMenu with title pTitle & tab & pVer with prompt ¬
						"Choose perspective for: " & linefeed & linefeed & strFileName & linefeed default items {item 1 of lstMenu} ¬
						OK button name "OK" cancel button name "Cancel" with empty selection allowed without multiple selections allowed
					if strViewTitle = false then return missing value
					set strViewTitle to item 1 of strViewTitle
					
					-- THEN ASK THE PLUGIN FOR A CUSTOM REPORT BY NAME
					set strViewPlugin to strViewPlugin
					set strViewJSON to (evaluate script my fnCall(pjsGetJSONByName) with options {viewname:strViewTitle, pluginPath:strViewPlugin})
					
					-- GENERATE THE CHOSEN REPORT TYPE FOR THE ACTIVE DOCUMENT
					set recSourceSpec to {menufile:strMenuPath, menuitem:strViewTitle}
					set recOptions to {viewname:strViewTitle, activedoc:strFileName, frontmatter:pblnFrontMatter, packlist:lstPackList, sourcespec:recSourceSpec, pluginPath:strViewPlugin}
					set strView to (evaluate script my fnCall(pjsGetCustomViewByName) with options recOptions)
					
					if strView ≠ "" then
						-- Prepend the menu name of the view
						--set strView to pstrTitlePrefix & strViewTitle & linefeed & linefeed & strView
						activate
						--try
						-- AND OFFER OPTIONS FOR USING THE REPORT
						tell (display dialog "[ " & strFileName & " ]" & linefeed & linefeed & strView buttons {"Cancel", pstrViewInMarked, "Menu"} cancel button "Cancel" default button "Menu" with title pTitle & "  ver. " & pVer)
							set strButton to button returned
							
							if strButton = "Copy" then
								tell application "Finder" to set the clipboard to strView
							else if strButton = pstrViewInMarked then
								-- Save to default views folder and open in marked
								my ViewInMarked(pstrViewFolder, strViewTitle, strView, strViewJSON)
							else if strButton = "Menu" then
								tell oApp
									activate
									set varChoice to choose from list lstSubMenu with title pTitle & tab & pVer with prompt ¬
										strViewTitle & linefeed & linefeed & "Choose:" default items {pstrEditQuery} ¬
										OK button name "OK" cancel button name "Cancel" with empty selection allowed and multiple selections allowed
								end tell
								if varChoice = false then return missing value
								set varChoice to item 1 of varChoice
								if varChoice = "Edit Query in FT" then
									set strNewDoc to my CommentWrapped(strViewJSON, strViewTitle) & my ReportWrapped(strView, strViewTitle)
									tell oApp
										set oNewDoc to make new document with properties {text contents:strNewDoc}
										activate
									end tell
								end if
							end if
						end tell
					else
						display dialog "No matches found in active document for this query:" & linefeed & linefeed & strViewJSON buttons {"OK"} default button "OK" with title pTitle & "  ver. " & pVer
					end if
					
				end if
			end tell
		else
			return "No documents open in FoldingText"
		end if
	end tell
end run


on ViewInMarked(strFolderPath, strMenuName, strView, strViewJSON)
	
	
	--set {strName, oFile} to {name, file} of it
	--if oFile is missing value then
	--	display dialog "The document: " & return & return & strName & ¬
	--		return & return & "needs to be saved before Marked can display perspectives." buttons {"OK"} ¬
	--		default button "OK" with title pTitle & "  ver. " & pVer
	--	return
	--end if
	
	set strAbsPath to my GetFolder(strFolderPath)
	if strAbsPath ≠ "" then
		if pblnIncludeQueryComment then
			set strView to my CommentWrapped(strViewJSON, strMenuName) & strView
		end if
		-- remove any forward slashes, to use the menu name as a file name
		set {dlm, my text item delimiters} to {my text item delimiters, "/"}
		set lstParts to text items of strMenuName
		set my text item delimiters to ""
		set strFileName to (lstParts as string) & ".md"
		set my text item delimiters to "/"
		
		set lstParts to text items of strAbsPath
		set strFolderPath to lstParts as string
		
		set strFullPath to (lstParts & strFileName) as string
		
		set strCmd to "echo " & quoted form of strView & " > " & quoted form of strFullPath
		do shell script strCmd
		
		tell application "Marked"
			--open (POSIX file strFolderPath as alias) -- get Marked to watch the perspectives folder
			activate
			open (POSIX file strFullPath as alias)
		end tell
		
	else
		display dialog "Folder not found:" & linefeed & linefeed & strFolderPath buttons {"OK"} default button "OK" with title pTitle & "  ver. " & pVer
	end if
	set my text item delimiters to dlm
	
end ViewInMarked


on fnCall(strCall)
	return "function(editor, options) {return require(options.pluginPath)." & strCall & ";}"
end fnCall

on CommentWrapped(strJSON, strMenuName)
	return "<!-- PLAIN TEXT QUERY FOR FOLDINGTEXT -->" & linefeed & "<!-- " & strMenuName & linefeed & strJSON & linefeed & "-->" & linefeed
end CommentWrapped

on ReportWrapped(strReport, strMenuName)
	return "<!-- REPORT BEGINS: " & strMenuName & " -->" & linefeed & linefeed & strReport & linefeed & "<!-- REPORT ENDS: " & strMenuName & " -->"
end ReportWrapped

on GetMenuPath()
	set strPath to POSIX path of (path to me)
	set {dlm, my text item delimiters} to {my text item delimiters, "/"}
	set strPath to ((text items 1 thru -2 of strPath) as string) & "/" & pstrMenuFile
	set my text item delimiters to dlm
	return strPath
end GetMenuPath

on GetJson(strPath)
	set strJSON to ""
	
	if fileexists(strPath) and FileNotEmpty(strPath) then
		set strCmd to "cat " & quoted form of strPath
		set strJSON to do shell script strCmd
	end if
	return strJSON
end GetJson

on WriteText2Path(strText, strPosixPath)
	set f to (POSIX file strPosixPath)
	open for access f with write permission
	write strText as «class utf8» to f
	close access f
end WriteText2Path


on pointUserToPlugins(lstMissing)
	-- TELL THE USER WHERE TO FIND THE REQUIRED PLUGINS
	set lngMissing to length of lstMissing
	
	set lstMenu to {}
	set lngDigits to length of (lngMissing as string)
	
	repeat with i from 1 to lngMissing
		tell (item i of lstMissing) as record
			set strItem to my padnum(i, lngDigits) & tab & its |name| & ":" & tab
			if its problem is null then
				set strItem to strItem & "not installed"
			else
				set strItem to strItem & "needs version " & its |version| & " (upgrade from " & its problem & ")"
			end if
		end tell
		set end of lstMenu to strItem
	end repeat
	
	set strMsg to (lngMissing as string) & space & pl("plugin", lngMissing) & space & apl("need", lngMissing) & ¬
		" to be installed or upgraded." & linefeed & linefeed & ¬
		"A: Copy each .ftplugin folder to:" & linefeed & tab & pTargetApp & " > File > Application Folder" & linefeed & linefeed & ¬
		"B: Close and reststart  " & pTargetApp & linefeed & ¬
		"C: Run this script again ..."
	
	tell application "FoldingText"
		
		activate
		set strViewTitle to choose from list lstMenu with title pTitle & tab & pVer with prompt ¬
			strMsg default items {item 1 of lstMenu} ¬
			OK button name "Go to plugins page for selected item" cancel button name ¬
			"Cancel" with empty selection allowed without multiple selections allowed
		if strViewTitle = false then
			set lngChoice to 0
		else
			set {dlm, my text item delimiters} to {my text item delimiters, tab}
			set lngChoice to (first text item of (item 1 of strViewTitle)) as integer
			set my text item delimiters to dlm
			set strCmd to "open " & quoted form of |url| of (item lngChoice of plstPlugins)
			
			do shell script strCmd
		end if
		return lngChoice
	end tell
	
end pointUserToPlugins

-- CHECK
--property plstPlugins : {¬
--	{name:"reminder tools", version:0.2, URL:pRTPluginLink, folder:pstrRTPluginFolder}, ¬
--	{name:"smalltime", version:0.2, URL:pRTPluginLink, folder:pstrRTPluginFolder} ¬
on loadedPlugins(oDoc)
	-- CHECK THAT REQUIRED PLUGINS ARE INSTALLED AND UP TO DATE
	tell application "FoldingText"
		tell oDoc
			set lstloadedPlugins to (evaluate script "
				function(editor, options) {
					'use strict'
					// check for plugins
					var	fnQuery = require('ft/util/queryparameter').QueryParameter,
						lstPlugins = fnQuery('pluginPaths', '').split(':'),
						lstFound = [];
						options.needed.forEach(function(dctPlugin) {
							var strFolder = '/Plug-Ins/' + dctPlugin.name + '.ftplugin/',
								lngPlugins = lstPlugins.length, strPluginPath,
								blnFound, i, oPlugin;
							for (i=0; i<lngPlugins; i++) {
								strPluginPath = lstPlugins[i];
								blnFound = (strPluginPath.indexOf(strFolder) !== -1);
								if (blnFound) {
									// check whether the plugin is up to date
									oPlugin = require(strPluginPath);
									if (oPlugin.version >= dctPlugin.version) {
										lstFound.push(strPluginPath);
									} else {
										lstFound.push(oPlugin.version);
									}
									break;
								}
							}
							if (!blnFound) {lstFound.push(null);}
						});
					return lstFound;
				}" with options {needed:plstPlugins})
		end tell
	end tell
	return lstloadedPlugins
end loadedPlugins

on GetFolder(strPath)
	if strPath contains "$" then
		set strQuoted to "\"" & strPath & "\""
	else
		set strQuoted to quoted form of strPath
	end if
	if (do shell script ("mkdir -p " & strQuoted & "; echo $?")) = "0" then
		return do shell script " echo " & strQuoted
	else
		return ""
	end if
end GetFolder


on fileexists(strPath)
	(do shell script ("test -e " & quoted form of strPath & "; echo $?")) = "0"
end fileexists

on IsFolder(strPath)
	(do shell script ("test -d " & quoted form of strPath & "; echo $?")) = "0"
end IsFolder

on FileNotEmpty(strPath)
	(do shell script ("test -s " & quoted form of strPath & "; echo $?")) = "0"
end FileNotEmpty


on abs(varN)
	if varN < 0 then
		return -varN
	else
		return varN
	end if
end abs


-- Left pad with zeroes to get a fixed digit length
on padnum(lngNum, lngDigits)
	set strNum to lngNum as string
	set lngGap to (lngDigits - (length of strNum))
	repeat while lngGap > 0
		set strNum to "0" & strNum
		set lngGap to lngGap - 1
	end repeat
	return strNum
end padnum

-- 'plugin' ⇄ 'plugins'
on pl(strWord, lng)
	if lng > 1 then
		strWord & "s"
	else
		strWord
	end if
end pl

-- 'need' ⇄ 'needs'
on apl(strWord, lng)
	if lng < 2 then
		strWord & "s"
	else
		strWord
	end if
end apl
