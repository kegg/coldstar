<cfset path_items = ArrayNew(1)>
<cfset path_items[1] = application.default_controller>
<cfset path_items[2] = 'index'>

<!---
	Here we work with the paths
		the first item is the controller
		the second item is the method in the controller
		anything beyond that is data we're passing to our controller'
--->
<cfif trim(cgi.path_info) neq "/" and trim(cgi.path_info) neq "">
	<cfset path_items = ListToArray(cgi.path_info,'/')>

	<cfif ArrayLen(path_items) eq 1>
		<cfset path_items[2] = 'index'>
	</cfif>

	<cfif not FileExists(expandPath('app/controller/#path_items[1]#.cfc'))>
		<cfinvoke component="app.controller.controller" method="Show404" />
		<cfabort>
	</cfif>
</cfif>

<!--- check to see if the method exists --->
<!--- get the variables list --->
<cfset variables.cfcToCheck = "app.controller.#path_items[1]#">
<cfset variables.cfcInfo = getComponentMetadata(variables.cfcToCheck)>
<!--- get an array of all of the info for each function. --->
<cfset variables.cfcFunctions = variables.cfcInfo.functions>
<cfset variables.functionList = "">
<!--- loop through each function and add its name to the list. --->
<cfloop array="#variables.cfcFunctions#" index=" variables.i">
    <cfset variables.functionList = listAppend(variables.functionList, variables.i.name)>
</cfloop>

<cfif ArrayLen(path_items) gt 0 and ListFindNoCase(variables.functionList,"#path_items[2]#")>
	<cfobject component="app.controller.#path_items[1]#" name="my_component">
	<cfinvoke component="#my_component#" method="init" />
	<cfinvoke component="#my_component#" method="#path_items[2]#">
		<cfif ArrayLen(path_items) gt 2>
			<cfset arg_array = ArrayNew(1)>
			<cfloop from="3" to="#ArrayLen(path_items)#" index="i">
				<cfset ArrayAppend(arg_array, path_items[i])>
			</cfloop>
			<cfinvokeargument name="args" value="#arg_array#" />
		</cfif>
	</cfinvoke>
<cfelse>
	<cfinvoke component="app.controller.controller" method="Show404" />
</cfif>