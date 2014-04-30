component {
	public validate function init() {
		return this;
	}
	
	public boolean function runValidate(required string errors) {
		var output = false;
		
		if (len(trim(errors)) eq 0) {
			output = true;
		}
		
		return output;
	}
	
	public string function validateField(required string formfield_value, required string nice_name, required string validation_rules) {
		
		var errors = "";
		var errors_list = ArrayNew(1);
		
		for (i = 1; i lte ListLen(arguments.validation_rules, "|"); i = i + 1) {
			
			var rule_to_test = 	ListGetAt(arguments.validation_rules, i, "|");
			
			if (left(rule_to_test, 9) eq "minlength") {
				rule_to_test = "minlength";
				var length = replace(ListGetAt(arguments.validation_rules, i, "|"), "minlength[", "");
				length = replace(length, "]", "");
			} else if (left(rule_to_test, 9) eq "maxlength") {
				rule_to_test = "maxlength";
				var length = replace(ListGetAt(arguments.validation_rules, i, "|"), "maxlength[", "");
				length = replace(length, "]", "");
			}
			
			switch (#rule_to_test#) {
				case "date":
						if (not isValid("date", trim(arguments.formfield_value))) {
							ArrayAppend(errors_list, arguments.nice_name & " is not a valid date");
						}
					break;
				case "required":
						if (len(trim(arguments.formfield_value)) eq 0) {
							ArrayAppend(errors_list, arguments.nice_name & " is a required field.");
						}
					break;
				case "email":
						if (not isValid("email", trim(arguments.formfield_value))) {
							ArrayAppend(errors_list, arguments.nice_name & " is not a valid e-mail address");
						}
					break;
				case "phone":
						if (not isValid("telephone", trim(arguments.formfield_value))) {
							ArrayAppend(errors_list, arguments.nice_name & " is not in a valid telephone number format");
						}
					break;
				case "minlength":
						if (len(trim(arguments.formfield_value)) lt length) {
							ArrayAppend(errors_list, arguments.nice_name & " cannot be less than " & length & " characters.");
						}
					break;
				case "maxlength":
						if (len(trim(arguments.formfield_value)) gt length) {
							ArrayAppend(errors_list, arguments.nice_name & " cannot be more than " & length & " characters.");
						}
					break;
				default:
					ArrayAppend(errors_list, ListGetAt(arguments.validation_rules, i, "|") & " Isn't a valid validation type.");
					break;
			}
		}
		
		for (i = 1; i lte ArrayLen(errors_list); i = i + 1) {
			errors = errors & "<p>#errors_list[i]#</p>";
		}
		
		return errors;
	}
}