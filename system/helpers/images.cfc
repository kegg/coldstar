component {
	public images function init() {
		return this;
	}
	
	public string function image(required string load_url, string attributes = "") {
		var output = '<img src="#application.site_url##arguments.load_url#" #arguments.attributes#>';
		
		return output;
	}
}