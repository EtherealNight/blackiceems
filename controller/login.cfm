<html>
	<head>
		<title>LogIn</title>
		<link href="css/style.css" type="text/css" rel="stylesheet" />
	<body>
			<div id="main_wrapper">
				<div class="inner_wrap">
					<div class="contact_inner_right">
						<div class="contact_form">
						<cfif isDefined("form.log_in")>
							<cfset dao = createObject("component", "dao").init( username = form.username, pass = form.pass ) />
							<cfset login = createObject("component", "Register").init( DSN = "myDSN" ) />
							<cfset msg = login.log_in_user( dao ) />
							<cfoutput>#msg#</cfoutput>
						</cfif>
							<form method="post">
										<div class="contact_form_heading">
											<h1>LogIn</h1>
											<span>*Indicates Required</span>
										</div>
											<input type="text" name="username" id="username" placeholder="User Name*"/>
											<input type="password" name="pass" id="pass" placeholder="Password" />
									<div id="submit">
										<input type="submit" name="log_in" value="LogIn" id="log_in" onClick="return log_form()" />
									</div>
							</form>
								<div align="center">
									<a href="forgot.cfm">Forgot Password</a>
								</div>
									<div id="uname" style="color:#FF0000; display:none;">Please Enter User Name.</div>
				 				<div id="passw" style="color:#FF0000; display:none;">Please Enter password.</div>
						</div>
					</div>
							<div class="clear"></div>
				</div>
						<div class="clear"></div>
			</div>
		</body>
	</head>
</html>

	
	
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
 <script type="text/javascript" language="javascript">
 function log_form(){
 if($('#username').val() == '')
 { 
  $('#passw').hide();
  $('#uname').show();
  return false;
 }
 
 if($('#pass').val() == '')
 {
  $('#uname').hide();
  $('#passw').show();
  return false;
 }
 }
 </script>