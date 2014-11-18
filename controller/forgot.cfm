<html>
	<head>
		<title>Forgot Password</title>
		<link href="css/style.css" type="text/css" rel="stylesheet" />
		<body>
			<div id="main_wrapper">
				<div class="inner_wrap">
					<div class="contact_inner_right">
						<div class="contact_form">
						<cfif IsDefined('form.send')>
							<cfset dao = createObject("component", "dao").init( email = form.email ) />
							<cfset login = createObject("component", "Register").init( DSN = "myDSN" ) />
							<cfset msg=login.getpass( dao ) />
							<cfoutput>#msg#</cfoutput>
						</cfif>
							<form method="post" name="login" id="login">
										<div class="contact_form_heading">
											<h1>Forgot Password</h1>
											<span>*Indicates Required</span>
										</div>
										<span style="color:#00FF00;">Enter Email To Send Password</span>
											<input type="email" name="email" id="email" placeholder="Email*"/>
											<div id="submit">
												<input type="submit" name="send" value="Send Email" id="send" />
											</div>
							</form>
						</div>
					</div>
							<div class="clear"></div>
								<div id="uname" style="color:#FF0000; display:none;">Please Enter User Name.</div>
								<div id="passw" style="color:#FF0000; display:none;">Please Enter password.</div>
			 </div>
						<div class="clear"></div>
		 </div>
		</body>
	</head>
</html>