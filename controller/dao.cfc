<cfcomponent name="dao">

<cffunction name="init" access="public" 
    output="false" returntype="any">
		
		
			<cfargument name="firstname" type="string" >
			<cfargument name="email" type="string" >
			<cfargument name="username" type="string" >					
			<cfargument name="pass" type="string" >
			
			
    <cfset variables.instance = structNew() />

    <cfset setFirstName( arguments.firstname ) />
    <cfset setEmail( arguments.email ) />
    <cfset setUSerName( arguments.username ) />
    <cfset setPassword( arguments.pass ) />

    <cfreturn this />

</cffunction>

<!--- register.firstname --->

<cffunction name="setFirstName" access="private" 
    output="false" returntype="void">
    <cfargument name="firstname" required="true" 
        type="string" />
    <cfset variables.instance.firstname = arguments.firstname />
</cffunction>

<cffunction name="getFirstName" access="public" 
    output="false" returntype="string">
    <cfreturn variables.instance.firstname />
</cffunction>

<!--- register.email --->

<cffunction name="setEmail" access="private" 
    output="false" returntype="void">
    <cfargument name="email" required="true" 
        type="string" />
    <cfset variables.instance.email = arguments.email />
</cffunction>

<cffunction name="getEmail" access="public" 
    output="false" returntype="string">
    <cfreturn variables.instance.email />
</cffunction>

<!--- register.username --->

<cffunction name="setUserName" access="private" 
    output="false" returntype="void">
    <cfargument name="username" required="true" 
        type="string" />
    <cfset variables.instance.username = arguments.username />
</cffunction>

<cffunction name="getUserName" access="public" 
    output="false" returntype="string">
    <cfreturn variables.instance.username />
</cffunction>

<!--- register. password--->

<cffunction name="setPassword" access="private" 
    output="false" returntype="void">
    <cfargument name="pass" required="true" 
        type="string" />
    <cfset variables.instance.pass = arguments.pass />
</cffunction>

<cffunction name="getPassword" access="public" 
    output="false" returntype="string">
    <cfreturn variables.instance.pass />
</cffunction>

</cfcomponent>