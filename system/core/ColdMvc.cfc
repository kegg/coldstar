<cfcomponent output="false">

	<cfscript>
		public ColdMvc function init() {
			return this;				
		}

		public void function loadView(required string view_to_load, struct content = StructNew()) {
			if (StructKeyExists(content,"view")) {
				savecontent variable="content.html" { 
					include "#application.base_url#app/view/#content.view#.cfm"; 
				}
			}
			include "#application.base_url#app/view/#arguments.view_to_load#.cfm";	
		}
		
		public void function loadError(required string error_to_load) {
			include "#application.base_url#app/errors/#arguments.error_to_load#.cfm";
		}
	</cfscript>
</cfcomponent>