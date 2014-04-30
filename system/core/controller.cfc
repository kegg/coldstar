<cfcomponent output="false">

	<cffunction name="init" output="true" returntype="any" access="public">
		<cfreturn this>
	</cffunction>

	<cffunction name="Show404" output="true" returntype="void" access="public">
		<cfset application.coldmvc.loadError('404')>
	</cffunction>
	
	<cffunction name="go" output="false" returntype="void" access="public">
		<cfargument name="place_to_go" required="true" type="string">
		<cfset url_to_go = #application.base_url# & #application.index_page# & "/" & #place_to_go#>
		<cflocation url="#url_to_go#">
	</cffunction>

</cfcomponent>