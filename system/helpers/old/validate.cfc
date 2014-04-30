<cfcomponent>
	<cffunction name="init" access="public" returntype="validate">
		<cfreturn this>
	</cffunction>
	
	<cffunction name="runValidate" access="public" returntype="boolean">
		<cfargument name="errors" type="string" required="true">
		
		<cfset var output = false>
		
		<cfif (len(trim(errors)) eq 0)>
			<cfset output = true>
		</cfif>
		
		<cfreturn output>		
	</cffunction>

	<cffunction name="validateField" access="public" returntype="string">
		<cfargument name="formfield_value" type="string" required="true">
		<cfargument name="nice_name" type="string" required="true">
		<cfargument name="validation_rules" type="string" required="true">

		<cfset var errors = "">
		<cfset var errors_list = ArrayNew(1)>
		
		<cfloop list="#arguments.validation_rules#" index="i" delimiters="|">
			<cfset var rule_to_test = i>
			
			<cfif (left(rule_to_test, 9) eq "minlength")>
				<cfset rule_to_test = "minlength">
				<cfset var length = replace(i, "minlength[", "")>
				<cfset length = replace(length, "]", "")>
			<cfelseif (left(rule_to_test, 9) eq "maxlength")>
				<cfset rule_to_test = "maxlength">
				<cfset var length = replace(i, "maxlength[", "")>
				<cfset length = replace(length, "]", "")>
			</cfif>			
		</cfloop>

		<cfswitch expression="#rule_to_test#">
			<cfcase value="date">
				<cfif (not isValid("date", trim(arguments.formfield_value)))>
					<cfset ArrayAppend(errors_list, arguments.nice_name & " is not a valid date.")>
				</cfif>
			</cfcase>
			<cfcase value="required">
				<cfif (len(trim(arguments.formfield_value)) eq 0)>
					<cfset ArrayAppend(errors_list, arguments.nice_name & " is a required field.")>
				</cfif>
			</cfcase>
			<cfcase value="email">
				<cfif (not isValid("email", trim(arguments.formfield_value)))>
					<cfset ArrayAppend(errors_list, arguments.nice_name & " is not a valid e-mail address")>				
				</cfif>
			</cfcase>
			<cfcase value="phone">
				<cfif (not isValid("telephone", trim(arguments.formfield_value)))>
					<cfset ArrayAppend(errors_list, arguments.nice_name & " is not in a valid telephone number format.")>			
				</cfif>
			</cfcase>
			<cfcase value="minlength">
				<cfif (len(trim(arguments.formfield_value)) lt length)>
					<cfset ArrayAppend(errors_list, arguments.nice_name & " cannot be less than " & length & " characters.")>				
				</cfif>
			</cfcase>
			<cfcase value="maxlength">
				<cfif (len(trim(arguments.formfield_value)) gt length)>
					<cfset ArrayAppend(errors_list, arguments.nice_name & " cannot be more than " & length & " characters.")>
				</cfif>
			</cfcase>
			<cfdefaultcase>
				<cfset ArrayAppend(errors_list, ListGetAt(arguments.validation_rules, i, "|") & " Isn't a valid validation type.")>
			</cfdefaultcase>
		</cfswitch>

		<cfloop from="1" to="#ArrayLen(errors_list)#" index="i">
			<cfset errors = errors & "<p>#errors_list[i]#</p>">
		</cfloop>
		
		<cfreturn errors>
	</cffunction>
</cfcomponent>