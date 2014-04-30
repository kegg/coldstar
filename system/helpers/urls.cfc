component {
	public urls function init() {
		return this;
	}

	public string function anchor(required string load_url, string title = "", string attributes = "") {
		var output = '<a href="#application.base_url##application.index_page#/#arguments.load_url#"';
		
		if (len(arguments.title) eq 0) {
			arguments.title = arguments.load_url;
		}
		
		if (len(arguments.attributes) gt 0) {
			output = output & ' ' & arguments.attributes;
		}
		
		output = output & '>#arguments.title#</a>';
		
		return output;
	}
	
	public string function imgAnchor(required string load_url, required string image, string attributes = "") {
		var output = '<a href="#application.base_url##application.index_page#/#arguments.load_url#"';
		
		if (len(arguments.attributes) gt 0) {
			output = output & ' ' & arguments.attributes;
		}

		output = output & '><img src="#application.site_url##arguments.image#"></a>';
		
		return output;		
	}
	
	public string function imgCloseWindow(required string image, string attributes = "") {
		var output = '<a href="javascript:self.close();" #arguments.attributes#><img src="#application.site_url##arguments.image#"></a>';
		return output;
	}
	
	public string function mailto(required string email, string title = "", string attributes = "") {
		var output = '<a href="mailto:#arguments.email#"';
		
		if (len(arguments.title) eq 0) {
			arguments.title = arguments.email;
		}
		
		if (len(arguments.attributes) gt 0) {
			output = output & ' ' & arguments.attributes;
		}
		
		output = output & '>#arguments.title#</a>';
		
		return output;
	}
	
	public string function siteUrl(string load_url = "") {
		var output = application.site_url;
		
		if (len(arguments.load_url) gt 0) {
			output = output & arguments.load_url;
		}
		
		return output;
	}
	
	public string function anchor_pop(required struct window_vars, string attributes = "") {
		var output = '<a href="#application.base_url##application.index_page#/#arguments.window_vars.href#" #arguments.attributes#';
		
		var attr = "";
		
		if (StructKeyExists(arguments.window_vars, 'width')) {
			attr = ListAppend(attr, 'width=#arguments.window_vars.width#');
		}
		
		if (StructKeyExists(arguments.window_vars, 'height')) {
			attr = ListAppend(attr, 'height=#arguments.window_vars.height#');
		}
		
		if (StructKeyExists(arguments.window_vars, 'scrollbars')) {
			attr = ListAppend(attr, 'scrollbars=#arguments.window_vars.scrollbars#');
		}
		
		if (StructKeyExists(arguments.window_vars, 'status')) {
			attr = ListAppend(attr, 'status=#arguments.window_vars.status#');
		}
		
		if (StructKeyExists(arguments.window_vars, 'resizable')) {
			attr = ListAppend(attr, 'resizable=#arguments.window_vars.resizable#');
		}
		
		output = output & ' onClick="javascript:window.open(this.href, ' & "'#arguments.window_vars.name#'" & ", '#attr#');return false;"">";

		if (StructKeyExists(arguments.window_vars, 'title')) {
			output = output & arguments.window_vars.title;
		}
		
		output = output & '</a>';
		
		return output;
	}
}