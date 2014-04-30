<cfapplication name="mymvcapp" sessionmanagement="true">

<!--- include configs --->
  <!--- include config file --->
  <cfinclude template="app/config/config.cfm">

<!--- set the base url --->
  <cfparam name="http_var" default="http://">
  <cfif cgi.https eq "on">
    <cfset http_var = "https://">
  </cfif>

  <cfparam name="server_port_var" default="">
  <cfif cgi.server_port neq "80">
    <cfset server_port_var = ":" & cgi.server_port>
  </cfif>

  <cfset application.base_url = replace(application.site_url, http_var & cgi.server_name & server_port_var & '/', '/')>

<!--- set application wide models --->
  <cfset application.coldmvc = CreateObject('component', 'system.core.ColdMvc').init()>

<!--- load helpers --->
  <cfset structAppend(url, createObject('component', 'system.helpers.forms'))>
  <cfset structAppend(url, createObject('component', 'system.helpers.urls'))>
  <cfset structAppend(url, createObject('component', 'system.helpers.validate'))>
  <cfset structAppend(url, createObject('component', 'system.helpers.images'))>
  <cfset structAppend(url, createObject('component', 'app.helpers.state'))>

  <!--- custom models --->
