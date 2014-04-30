component {
	public forms function init() {
		return this;
	}

	public string function form_open(required string action, string id = "", string attributes = "") {
		var output = '<form method="post"';
		var form_url = #application.base_url# & #application.index_page# & '/' & #arguments.action#;
				
		if (len(arguments.id) gt 0) {
			output = output & ' name="#arguments.id#" id="#arguments.id#"';
		}
		
		output = output & ' action="#form_url#"';
		
		if (len(arguments.attributes) gt 0) {
			output = output & ' ' & arguments.attributes;
		}
		
		output = output & '>';
		
		return output;
	}
	
	public string function form_openmulti(required string action, string id = "", string attributes = "") {
		var output = '<form method="post" enctype="multipart/form-data"';
		var form_url = #application.base_url# & #application.index_page# & '/' & #arguments.action#;
				
		if (len(arguments.id) gt 0) {
			output = output & ' name="#arguments.id#" id="#arguments.id#"';
		}
		
		output = output & ' action="#form_url#"';
		
		if (len(arguments.attributes) gt 0) {
			output = output & ' ' & arguments.attributes;
		}
		
		output = output & '>';
		
		return output;
	}	
	
	public string function form_close() {
		return '</form>';
	}
	
	public string function form_label(required string label_text, required string label_field, string attributes = "") {
		var output = '<label';
	
		if (len(arguments.attributes) gt 0) {
			output = output & ' ' & arguments.attributes;
		}
		
		output = output & ' for="#arguments.label_field#">#arguments.label_text#</label>';
	
		return output;
	}
	
	public string function form_input(required string id, string value = "", string attributes = "") {
		var output = '<input type="text" name="#arguments.id#" id="#arguments.id#"';
		
		if (len(arguments.value) gt 0) {
			output = output & ' value="#arguments.value#"';
		}
	
		if (len(arguments.attributes) gt 0) {
			output = output & ' ' & arguments.attributes;
		}
		
		output = output & '>';
		
		return output;
	}
	
	public string function form_file(required string id, string attributes = "") {
		var output = '<input type="file" name="#arguments.id#" id="#arguments.id#"';
		
		if (len(arguments.attributes) gt 0) {
			output = output & ' ' & arguments.attributes;
		}
		
		output = output & '>';
		
		return output;
	}	
	
	public string function form_hidden(required string id, required string value = "") {
		var output = '<input type="hidden" name="#arguments.id#" id="#arguments.id#"';
		
		output = output & ' value="#arguments.value#"';
		
		output = output & '>';
		
		return output;
	}
	
	public string function form_password(required string id, string value = "", string attributes = "") {
		var output = '<input type="password" name="#arguments.id#" id="#arguments.id#"';
		
		if (len(arguments.value) gt 0) {
			output = output & ' value="#arguments.value#"';
		}
	
		if (len(arguments.attributes) gt 0) {
			output = output & ' ' & arguments.attributes;
		}
		
		output = output & '>';
		
		return output;
	}
	
	public string function form_textarea(required string id, string value = "", string attributes = "") {
		var output = '<textarea name="#arguments.id#" cols="80" rows="30" id="#arguments.id#"';
		
		if (len(arguments.attributes) gt 0) {
			output = output & ' ' & arguments.attributes;
		}
		
		output = output & '>#arguments.value#</textarea>';
		
		return output;
	}
	
	public string function form_submit(required string id, required string value, string attributes = "") {
		var output = '<input type="submit" name="#arguments.id#" id="#arguments.id#"';
		
		output = output & ' value="#arguments.value#"';
	
		if (len(arguments.attributes) gt 0) {
			output = output & ' ' & arguments.attributes;
		}
		
		output = output & '>';
		
		return output;
	}
	
	public string function form_reset(required string id, required string value, string attributes = "") {
		var output = '<input type="reset" name="#arguments.id#" id="#arguments.id#"';
		
		output = output & ' value="#arguments.value#"';
	
		if (len(arguments.attributes) gt 0) {
			output = output & ' ' & arguments.attributes;
		}
		
		output = output & '>';
		
		return output;
	}
	
	public string function form_button(required string id, required string value, string attributes = "") {
		var output = '<input type="button" name="#arguments.id#" id="#arguments.id#"';
		
		output = output & ' value="#arguments.value#"';
	
		if (len(arguments.attributes) gt 0) {
			output = output & ' ' & arguments.attributes;
		}
		
		output = output & '>';
		
		return output;
	}
	
	public string function form_checkbox(required string name, required array value, string attributes = "") {
		var output = "";
		
		for (i = 1; i <= ArrayLen(value); i++) {
			output = output & '<input type="checkbox" name="#arguments.name#" id="#arguments.name##i#" value="#arguments.value[i]#" #arguments.attributes#>';
			output = output & '#arguments.value[i]#<br>';
		}
		
		return output;
	}
	
	public string function form_radio(required string name, required array value, string attributes = "") {
		var output = "";
		
		for (i = 1; i <= ArrayLen(value); i++) {
			output = output & '<input type="radio" name="#arguments.name#" id="#arguments.name##i#" value="#arguments.value[i]#" #arguments.attributes#>';
			output = output & '#arguments.value[i]#<br>';
		}
		
		return output;
	}
	
	public string function form_select(required string id, required array selectarray, string selected = "", string attributes = "") {
		var output = '<select id="#arguments.id#" name="#arguments.id#" #arguments.attributes#>';
		
		output = output & '<option value="0"></option>';
		
		for (i = 1; i <= ArrayLen(selectarray); i++) {
			output = output & '<option value="#i#"';
			
			if (i eq selected) {
				output = output & ' selected="selected"';
			}
			
			output = output & '>#selectarray[i]#</option>';
		}
		
		output = output & '</select>';
		
		return output;
	}
	
	public string function setValue(required string fieldname) {
		var output = "";
		
		if (StructKeyExists(form, fieldname)) {
			output = form[fieldname];
		}
		
		return output;
	}
}