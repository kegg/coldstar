<cfcomponent>

	<cffunction name="init" access="public" returntype="urls">
		<cfreturn this>
	</cffunction>
	
	<cffunction name="anchor" access="public" returntype="string">
		<cfargument name="load_url" type="string" required="true">
		<cfargument name="title" type="string" required="false" default="">
		<cfargument name="attributes" type="string" required="false" default="">
		
		<cfset var output = '<a href="#application.base_url##application.index_page#/#arguments.load_url#"'>
		
		<cfif (len(arguments.title) eq 0)>
			<cfset arguments.title = arguments.load_url>
		</cfif>
		
		<cfif (len(arguments.attributes) gt 0)>
			<cfset output = output & ' ' & arguments.attributes>
		</cfif>
		
		<cfset output = output & '>#arguments.title#</a>'>
		
		<cfreturn output>
	</cffunction>
	
	<cffunction name="imgAnchor" access="public" returntype="string">
		<cfargument name="load_url" type="string" required="true">
		<cfargument name="image" type="string" required="true">
		<cfargument name="attributes" type="string" required="false" default="">
		
		<cfset var output = '<a href="#application.base_url##application.index_page#/#arguments.load_url#"'>
		
		<cfif (len(arguments.attributes) gt 0)>
			<cfset output = output & ' ' & arguments.attributes>
		</cfif>

		<cfset output = output & '><img src="#application.site_url##arguments.image#"></a>'>
		
		<cfreturn output>		
	</cffunction>

	<cffunction name="imgCloseWindow" access="public" returntype="string">
		<cfargument name="image" type="string" required="true">
		<cfargument name="attributes" type="string" required="false" default="">
		
		<cfset var output = '<a href="javascript:self.close();" #arguments.attributes#><img src="#application.site_url##arguments.image#"></a>'>
		
		<cfreturn output>
	</cffunction>

	<cffunction name="mailto" access="public" returntype="string">
		<cfargument name="email" type="string" required="true">
		<cfargument name="title" type="string" required="false" default="">
		<cfargument name="attributes" type="string" required="false" default="">
		
		<cfset var output = '<a href="mailto:#arguments.email#"'>
		
		<cfif (len(arguments.title) eq 0)>
			<cfset arguments.title = arguments.email>
		</cfif>
		
		<cfif (len(arguments.attributes) gt 0)>
			<cfset output = output & ' ' & arguments.attributes>
		</cfif>
		
		<cfset output = output & '>#arguments.title#</a>'>
		
		<cfreturn output>
	</cffunction>

	<cffunction name="siteUrl" access="public" returntype="string">
		<cfargument name="load_url" type="string" required="false" default="">
		
		<cfset var output = application.site_url>
		
		<cfif (len(arguments.load_url) gt 0)>
			<cfset output = output & arguments.load_url>
		</cfif>
		
		<cfreturn output>		
	</cffunction>

	<cffunction name="anchor_pop" access="public" returntype="string">
		<cfargument name="window_vars" type="struct" required="true">
		<cfargument name="attributes" type="string" required="false" default="">
		
		<cfset var output = '<a href="#application.base_url##application.index_page#/#arguments.window_vars.href#" #arguments.attributes#'>
		
		<cfset var attr = "">
		
		<cfif (StructKeyExists(arguments.window_vars, 'width'))>
			<cfset attr = ListAppend(attr, 'width=#arguments.window_vars.width#')>
		</cfif>
		
		<cfif (StructKeyExists(arguments.window_vars, 'height'))>
			<cfset attr = ListAppend(attr, 'height=#arguments.window_vars.height#')>
		</cfif>
		
		<cfif (StructKeyExists(arguments.window_vars, 'scrollbars'))>
			<cfset attr = ListAppend(attr, 'scrollbars=#arguments.window_vars.scrollbars#')>
		</cfif>
		
		<cfif (StructKeyExists(arguments.window_vars, 'status'))>
			<cfset attr = ListAppend(attr, 'status=#arguments.window_vars.status#')>
		</cfif>
		
		<cfif (StructKeyExists(arguments.window_vars, 'resizable'))>
			<cfset attr = ListAppend(attr, 'resizable=#arguments.window_vars.resizable#')>
		</cfif>
		
		<cfset output = output & ' onClick="javascript:window.open(this.href, ' & "'#arguments.window_vars.name#'" & ", '#attr#');return false;"">">

		<cfif (StructKeyExists(arguments.window_vars, 'title'))>
			<cfset output = output & arguments.window_vars.title>
		</cfif>
		
		<cfset output = output & '</a>'>
		
		<cfreturn output>
	</cffunction>
</cfcomponent>