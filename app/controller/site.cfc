<cfcomponent output="false" extends="controller">
	
	<cffunction name="index" access="public" output="true" returntype="void">
		<cfset content = StructNew()>	
		<cfset content.title = "Home">
		<cfset content.view = "site/home_view">
		
		<cfset application.coldmvc.loadView('template', content)>
	</cffunction>

	<cffunction name="about" access="public" output="true" returntype="void">
		<cfset content = StructNew()>
		<cfset content.title = "About">
		<cfset content.view = "site/about_view">
		
		<cfset application.coldmvc.loadView('template', content)>
	</cffunction>
</cfcomponent>