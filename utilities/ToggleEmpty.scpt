JsOsaDAS1.001.00bplist00�Vscript_function run() {
	var toggleEmpty = function () { performAction('toggle empty lines') };
	
	var	appFT=Application("FoldingText"),
		lstDocs = appFT.documents(),
		lngDocs = lstDocs.length;		
	
	if (lngDocs) { lstDocs[0].evaluate({ script:toggleEmpty.toString() }); }
}                              "jscr  ��ޭ