<cfcomponent>
	<cffunction name="init" access="public" returntype="images">
		<cfreturn this>
	</cffunction>

	<cffunction name="image" access="public" returntype="string">
		<cfargument name="load_url" type="string" required="true">
		<cfargument name="attributes" type="string" required="false" default="">
		
		<cfset var output = '<img src="#application.site_url##arguments.load_url#" #arguments.attributes#>'>
		
		<cfreturn output>
	</cffunction>
</cfcomponent>