<cfcomponent name="Register">

	<cffunction name="init" access="public" output="false" returntype="any">
			<cfargument name="DSN" required="true" type="string" hint="datasource" />
			<cfset variables.DSN = arguments.DSN />
			<cfreturn this />
	</cffunction>
		<!---User Registraton--->
        <!---Function pulls form values from flex form via Remote Object Call--->
	<cffunction name="add_info" access="remote" output="false" returntype="any">
			<cfargument name="firstname" type="string" >
			<cfargument name="email" type="string" >
			<cfargument name="username" type="string" >					
			<cfargument name="pass" type="string" >
            <!---Query Checks for Existing User In DB--->
					<cfquery name="get_email" datasource="marketmax2">
						select email,user_name from register where email = <cfqueryparam value="#form.email#" cfsqltype="cf_sql_varchar"> OR 		            user_name = <cfqueryparam value="#username#" cfsqltype="cf_sql_varchar">
					</cfquery>
                    <!---If No User found by email, record count set to 0--->
			<cfif get_email.RecordCount eq 0 >
            <!---New User is then created in the table--->
					<cfquery name="add_info" datasource="marketmax2">
						INSERT INTO  register (firstname,email,user_name,password)
						VALUES (<cfqueryparam value="#firstname#" cfsqltype="cf_sql_varchar">,
						<cfqueryparam value="#email#" cfsqltype="cf_sql_varchar">,
						<cfqueryparam value="#username#" cfsqltype="cf_sql_varchar">,
						<cfqueryparam value="#pass#" cfsqltype="cf_sql_varchar">)		
					</cfquery>
					<cfreturn 1>
			<cfelse>
					<cfreturn 0>
			</cfif>
	</cffunction>
		<!---End of User Registraton Functions--->


   <!---User Login --->
		<cffunction name="log_in_user" access="public" output="false" returntype="any">
						<cfargument name="login_user" type="dao" >					
							<cfquery name="getuser" datasource="#application.DSN#">
								select user_name,password from register where user_name= <cfqueryparam value="#arguments.login_user.getUserName()#"     		    cfsqltype="cf_sql_varchar"> AND password= <cfqueryparam value="#arguments.login_user.getPassword()#" cfsqltype=	            "cf_sql_varchar">
							</cfquery>
						<cfif getuser.recordcount gt 0 >
								 <cfset arguments.login_user.init( 
										username = getuser.user_name,
										pass = getuser.password )
								 />
								<cflocation url="home.cfm" addtoken="no">
								<cfreturn true />
						</cfif>
						<cfset msg = 'Email or username does not exist'> 
						<cfreturn msg />
		</cffunction>
   <!---User Login --->

	 <!---Password Retrival--->
		<cffunction name="getpass" access="remote" output="true" returntype="any">
					<cfargument name="forgot_pass" type="dao" >
						<cfquery name="getpass" datasource="marketmax2">
						  select password from register where email = <cfqueryparam value="#arguments.forgot_pass.getEmail()#" cfsqltype=	         	   "cf_sql_varchar">
						</cfquery>
					<cfif getpass.recordcount gt 0 >
								<cfset arguments.forgot_pass.init(pass = getpass.password)/>
								<cfmail to="#form.email#" from="saim.zhd@gmail.com" subject="Password Recovery">
									<cfmailpart type="text">
										Hi, test
										Your password is <cfoutput>#getpass.password#</cfoutput>.<br/>
									</cfmailpart>
								</cfmail>
								<cfset msg ='Password has been sent to your given email'>
						<cfreturn msg />
					</cfif>
					
					<cfset msg = 'Email or username does not exist'> 
					<cfreturn msg />
		</cffunction>
	 <!---Password Retrival--->
</cfcomponent>