property pTitle : "Register and handle ftdoc:// url scheme"

	Use in conjunction with the 'FTCopyAsURL' Applescript to get
	a URL which opens the specified document, optionally restoring selection and filter state.

"
	// given the switches from a url, and the document opened by that url,
	// set a nodepath, and/or select (all or part of) a line indicated by the url switches
	//eg    ftdoc:///Users/robintrew/Library/Application%20Support/Notational%20Velocity/project%20work.txt?line=3?startoffset=5?endoffset=10?nodepath=//@due

	function(editor, options) {
		var	tree=editor.tree(),
			oNode, rngSeln,
			strPath = options.nodepath, strLine=options.line,
			strStartOffset=options.startoffset, strEndOffset=options.endoffset,
			lngLine, lngStartOffset=0, lngEndOffset=-1, varStartOffset, varEndOffset;

		if (strPath !== null) {
			editor.setNodePath(strPath);
		}
		if (strLine !== null) {
			lngLine = parseInt(strLine, 10);
			if (lngLine !== NaN) {
				oNode = tree.lineNumberToNode(lngLine);
				if (editor.nodeIsHiddenInFold(oNode)) {
					editor.expandToRevealNode(oNode);
					editor.scrollToLine(lngLine);
				}
				if (strStartOffset !== null) {
					varStartOffset = parseInt(strStartOffset, 10);
					if (varStartOffset !== NaN) lngStartOffset = varStartOffset
				}
				if (strEndOffset !== null) {
					varEndOffset = parseInt(strEndOffset, 10);
					if (varEndOffset !== NaN) lngEndOffset = varEndOffset
				}
				rngSeln = tree.createRangeFromNodes(oNode, lngStartOffset, oNode, lngEndOffset);
				editor.setSelectedRange(rngSeln);
			}
		}
	}
"