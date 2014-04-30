<cfcomponent output="false">

	<!--- Load utils immidiately. --->
	<cfset variables.utils = createObject("component", "utils")>
	
	<!--- cfg file --->
	<cfset variables.cfgFile = "#ExpandPath('app/config')#/database.ini.cfm">

	<!---
	#	General Settings
	--->

	<cffunction name="init" access="public" output="true" returntype="any">
		<cfargument name="name" type="string" required="false" default="default" hint="App name, defaults to default in training.ini">

		<cfset instance = structNew()>
		<cfset instance.dsn = variables.utils.configParam(variables.cfgFile,arguments.name,"dsn")>
		<cfset instance.username = variables.utils.configParam(variables.cfgFile,arguments.name,"username")>
		<cfset instance.password = variables.utils.configParam(variables.cfgFile,arguments.name,"password")>

		<cfreturn this>
	</cffunction>

</cfcomponent>