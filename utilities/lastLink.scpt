JsOsaDAS1.001.00bplist00�Vscript_�// Nearest [MD](link) to the end of the file
function run() {

	var dctOptions = {
		clipfile: "$HOME/Library/Application Support/Notational Velocity/Clippings.txt",
	};
	
	var app = Application.currentApplication(),
		strQuotedPath = '"' + dctOptions.clipfile + '"',
		//strCMD="CLIPFILE=" + strQuotedPath + ";if [ -e \"$CLIPFILE\" ]; then cat -n \"$CLIPFILE\" | sort -t: -k 1nr,1 | grep -o -m 1 '\\[.*\\](.*)'; fi",
		strCMD="CLIPFILE=" + strQuotedPath + ";if [ -e \"$CLIPFILE\" ]; then cat -n \"$CLIPFILE\" | sort -t: -k 1nr,1 | grep -o -m 1 \'\\[.*\\](.*)\' ; fi",

		varResult='';
	
		app.includeStandardAdditions = true;
		
		try {
			varResult=app.doShellScript(strCMD);
		} catch (e) { varResult=''};
		
		return varResult;
}                              � jscr  ��ޭ