<cfset application.DSN = "marketmax2" />

<cfset application.registerDAO = createObject("component", "signup.Register").init( DSN = application.DSN ) />