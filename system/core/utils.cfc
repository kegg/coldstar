<cfcomponent displayname="utils" output="false" hint="Utilities">

	<!--- return the value from the ini file --->
	<cffunction name="configParam" output="false" returnType="string" access="public"
				hint="Basically says, try to get name.key in ini file, and if not, default to default.key. Also support %default% expansion, which just means replace with default value">
		<cfargument name="iniFile" type="string" required="true" />
		<cfargument name="name" type="string" required="true" />
		<cfargument name="key" type="string" required="true" />
		
		<cfset var result = getProfileString(iniFile,name,key) />
		
		<cfif result eq "">
			<cfset result = getProfileString(iniFile,"Default",key) />
		</cfif>
		
		<cfreturn result />
	</cffunction>
	
</cfcomponent>