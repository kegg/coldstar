<cfcomponent>
	<cffunction name="init" access="public" returntype="forms">
		<cfreturn this>
	</cffunction>
	
	<cffunction name="form_open" access="public" returntype="string">
		<cfargument name="action" type="string" required="true">
		<cfargument name="id" type="string" required="false" default="">
		<cfargument name="attributes" type="string" required="false" default="">

		<cfset var output = '<form method="post"'>
		<cfset var form_url = #application.base_url# & #application.index_page# & '/' & #arguments.action#>
				
		<cfif (len(arguments.id) gt 0)>
			<cfset output = output & ' name="#arguments.id#" id="#arguments.id#"'>
		</cfif>
		
		<cfset output = output & ' action="#form_url#"'>
		
		<cfif (len(arguments.attributes) gt 0)>
			<cfset output = output & ' ' & arguments.attributes>
		</cfif>
		
		<cfset output = output & '>'>
		
		<cfreturn output>
	</cffunction>
	
	<cffunction name="form_openmulti" access="public" returntype="string">
		<cfargument name="action" type="string" required="true">
		<cfargument name="id" type="string" required="false" default="">
		<cfargument name="attributes" type="string" required="false" default="">
		
		<cfset var output = '<form method="post" enctype="multipart/form-data"'>
		<cfset var form_url = #application.base_url# & #application.index_page# & '/' & #arguments.action#>
				
		<cfif (len(arguments.id) gt 0)>
			<cfset output = output & ' name="#arguments.id#" id="#arguments.id#"'>
		</cfif>
		
		<cfset output = output & ' action="#form_url#"'>
		
		<cfif (len(arguments.attributes) gt 0)>
			<cfset output = output & ' ' & arguments.attributes>
		</cfif>
		
		<cfset output = output & '>'>
		
		<cfreturn output>				
	</cffunction>

	<cffunction name="form_close" access="public" returntype="string">
		<cfreturn "</form>">
	</cffunction>

	<cffunction name="form_label" access="public" returntype="string">
		<cfargument name="label_text" type="string" required="true">
		<cfargument name="label_field" type="string" required="true">
		<cfargument name="attributes" type="string" required="false" default="">

		<cfset var output = '<label'>
	
		<cfif (len(arguments.attributes) gt 0)>
			<cfset output = output & ' ' & arguments.attributes>
		</cfif>
		
		<cfset output = output & ' for="#arguments.label_field#">#arguments.label_text#</label>'>
	
		<cfreturn output>
	</cffunction>

	<cffunction name="form_input" access="public" returntype="string">
		<cfargument name="id" type="string" required="true">
		<cfargument name="value" type="string" required="false" default="">
		<cfargument name="attributes" type="string" required="false" default="">
		
		<cfset var output = '<input type="text" name="#arguments.id#" id="#arguments.id#"'>
		
		<cfif (len(arguments.value) gt 0)>
			<cfset output = output & ' value="#arguments.value#"'>
		</cfif>
	
		<cfif (len(arguments.attributes) gt 0)>
			<cfset output = output & ' ' & arguments.attributes>
		</cfif>
		
		<cfset output = output & '>'>
		
		<cfreturn output>		
	</cffunction>

	<cffunction name="form_file" access="public" returntype="string">
		<cfargument name="id" type="string" required="true">
		<cfargument name="attributes" type="string" required="false" default="">
		
		<cfset var output = '<input type="file" name="#arguments.id#" id="#arguments.id#"'>
		
		<cfif (len(arguments.attributes) gt 0)>
			<cfset output = output & ' ' & arguments.attributes>
		</cfif>		

		<cfset output = output & '>'>
		
		<cfreturn output>
	</cffunction>

	<cffunction name="form_hidden" access="public" returntype="string">
		<cfargument name="id" type="string" required="true">
		<cfargument name="value" type="string" required="true">
		
		<cfset var output = '<input type="hidden" name="#arguments.id#" id="#arguments.id#"'>
		
		<cfset output = output & ' value="#arguments.value#"'>
		
		<cfset output = output & '>'>
		
		<cfreturn output>		
	</cffunction>

	<cffunction name="form_password" access="public" returntype="string">
		<cfargument name="id" type="string" required="true">
		<cfargument name="value" type="string" required="false" default="">
		<cfargument name="attributes" type="string" required="false" default="">
		
		<cfset var output = '<input type="password" name="#arguments.id#" id="#arguments.id#"'>
		
		<cfif (len(arguments.value) gt 0)>
			<cfset output = output & ' value="#arguments.value#"'>
		</cfif>
	
		<cfif (len(arguments.attributes) gt 0)>
			<cfset output = output & ' ' & arguments.attributes>
		</cfif>
		
		<cfset output = output & '>'>
		
		<cfreturn output>		
	</cffunction>

	<cffunction name="form_textarea" access="public" returntype="string">
		<cfargument name="id" type="string" required="true">
		<cfargument name="value" type="string" required="false" default="">
		<cfargument name="attributes" type="string" required="false" default="">
		
		<cfset var output = '<textarea name="#arguments.id#" cols="80" rows="30" id="#arguments.id#"'>
		
		<cfif (len(arguments.attributes) gt 0)>
			<cfset output = output & ' ' & arguments.attributes>
		</cfif>
		
		<cfset output = output & '>#arguments.value#</textarea>'>
		
		<cfreturn output>		
	</cffunction>

	<cffunction name="form_submit" access="public" returntype="string">
		<cfargument name="id" type="string" required="true">
		<cfargument name="value" type="string" required="false" default="">
		<cfargument name="attributes" type="string" required="false" default="">

		<cfset var output = '<input type="submit" name="#arguments.id#" id="#arguments.id#"'>
		
		<cfset output = output & ' value="#arguments.value#"'>
	
		<cfif (len(arguments.attributes) gt 0)>
			<cfset output = output & ' ' & arguments.attributes>
		</cfif>
		
		<cfset output = output & '>'>
		
		<cfreturn output>	
	</cffunction>

	<cffunction name="form_reset" access="public" returntype="string">
		<cfargument name="id" type="string" required="true">
		<cfargument name="value" type="string" required="false" default="">
		<cfargument name="attributes" type="string" required="false" default="">

		<cfset var output = '<input type="reset" name="#arguments.id#" id="#arguments.id#"'>
		
		<cfset output = output & ' value="#arguments.value#"'>
	
		<cfif (len(arguments.attributes) gt 0)>
			<cfset output = output & ' ' & arguments.attributes>
		</cfif>
		
		<cfset output = output & '>'>
		
		<cfreturn output>	
	</cffunction>

	<cffunction name="form_button" access="public" returntype="string">
		<cfargument name="id" type="string" required="true">
		<cfargument name="value" type="string" required="false" default="">
		<cfargument name="attributes" type="string" required="false" default="">

		<cfset var output = '<input type="button" name="#arguments.id#" id="#arguments.id#"'>
		
		<cfset output = output & ' value="#arguments.value#"'>
	
		<cfif (len(arguments.attributes) gt 0)>
			<cfset output = output & ' ' & arguments.attributes>
		</cfif>
		
		<cfset output = output & '>'>
		
		<cfreturn output>	
	</cffunction>
	
	<cffunction name="form_checkbox" access="public" returntype="string">
		<cfargument name="name" type="string" required="true">
		<cfargument name="value" type="array" required="true">
		<cfargument name="attributes" type="string" required="false" default="">
		
		<cfset var output = "">
		
		<cfloop from="1" to="#ArrayLen(value)#" index="i">
			<cfset output = output & '<input type="checkbox" name="#arguments.name#" id="#arguments.name##i#" value="#arguments.value[i]#" #arguments.attributes#>'>
			<cfset output = output & '#arguments.value[i]#<br>'>
		</cfloop>
		
		<cfreturn output>		
	</cffunction>

	<cffunction name="form_radio" access="public" returntype="string">
		<cfargument name="name" type="string" required="true">
		<cfargument name="value" type="array" required="true">
		<cfargument name="attributes" type="string" required="false" default="">
		
		<cfset var output = "">
		
		<cfloop from="1" to="#arrayLen(value)#" index="i">
			<cfset output = output & '<input type="radio" name="#arguments.name#" id="#arguments.name##i#" value="#arguments.value[i]#" #arguments.attributes#>'>
			<cfset output = output & '#arguments.value[i]#<br>'>
		</cfloop>
	
		<cfreturn output>			
	</cffunction>
	
	<cffunction name="form_select" access="public" returntype="string">
		<cfargument name="id" type="string" required="true">
		<cfargument name="selectarray" type="array" required="true">
		<cfargument name="selected" type="string" required="false" default="">
		<cfargument name="attributes" type="string" required="false" default="">

		<cfset var output = '<select id="#arguments.id#" name="#arguments.id#" #arguments.attributes#>'>
		
		<cfset output = output & '<option value="0"></option>'>
		
		<cfloop from="1" to="#ArrayLen(selectarray)#" index="i">
			<cfset output = output & '<option value="#i#"'>
			
			<cfif (i eq selected)>
				<cfset output = output & ' selected="selected"'>
			</cfif>
			
			<cfset output = output & '>#selectarray[i]#</option>'>			
		</cfloop>
		
		<cfset output = output & '</select>'>
		
		<cfreturn output>
	</cffunction>
	
	<cffunction name="setValue" access="public" returntype="string">
		<cfargument name="fieldname" type="string" required="true">
		
		<cfset var output = "">
		
		<cfif (StructKeyExists(form, fieldname))>
			<cfset output = form[fieldname]>
		</cfif>
		
		<cfreturn output>		
	</cffunction>
</cfcomponent>