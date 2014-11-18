<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>SignUp</title>
<link href="css/style.css" type="text/css" rel="stylesheet" />
</head>

<body>

	<cfparam name="form.firstname" default="">
	<cfparam name="form.email" default="">
	<cfparam name="form.username" default="">
	<cfparam name="form.pass" default="">
	<cfparam name="error" default="set">
	
		<cfif IsDefined("form.Register")>
			<cfif form.firstname EQ ''>
			<cfset error='Please Enter FirstName'>
			<cfelseif form.email EQ '' OR isValid("email", form.email) eq false >
			<cfset error='Please Enter Correct Email'>
			<cfelseif form.username EQ ''>
			<cfset error='Please Enter UserName'>
			<cfelseif form.pass EQ ''>
			<cfset error='Please Enter Password'>
			<cfelse>
			<cfset error=''>
			</cfif>
			
		</cfif>
	<div id="main_wrapper">
					<div align="right">
						<a href="login.cfm">LogIn</a>
					</div>	
		<div class="inner_wrap">

			<div class="contact_inner_right">
				
				<div class="contact_form">
					<form method="post" name="signup" id="signup">
						<div class="contact_form_heading">
							<h1>SignUp</h1>
							<span>*Indicates Required</span>
						</div>
						<input type="text" name="firstname" id="firtname" maxlength="10" placeholder="First Name*"/>
						<input type="text" name="email" class="email" id="email" placeholder="Email*"/>
						<input type="text" name="username" id="username" placeholder="User Name*"/>
						<input type="password" name="pass" class="pass" id="pass" placeholder="Password" />
						<div id="submit">
							
								<input type="submit" name="Register" value="Register" id="reg" onclick="return validate_form_fields()" />
								
						</div>
						
					</form>
				
				<div class="clear"></div>
				 <div id="fsname" style="color:#FF0000; display:none;">Please Enter First Name.</div>
				 <div id="e-mail" style="color:#FF0000; display:none;">Please Enter Email.</div>
				 <div id="uname" style="color:#FF0000; display:none;">Please Enter User Name.</div>
				 <div id="passw" style="color:#FF0000; display:none;">Please Enter password.</div>
				 
				 <cfif error NEQ '' AND error NEQ 'set'>
				 
						<div style="color:##FF0000;"><cfif error NEQ 'set'><cfoutput>#error#</cfoutput></cfif></div>
						<cfelseif error EQ ''>
						
					<cfinvoke component="Register" method="add_info"  returnvariable="value">
						<cfif IsDefined('value') AND value eq 1>
							Successfully register
								<cfmail to="#form.email#"
				from="saim.zhd@gmail.com" 
				subject="register">
				<cfmailpart type="text">
				Hi, test
					Your password is *****.<br/>
				</cfmailpart>
</cfmail>
						<cfelseif  IsDefined('value') AND value eq 0>
							This user name or email already exist
						</cfif>
				 </cfif>	
				</div>
			
				
			</div>
			
			
		
		<div class="clear"></div>
		</div>
	
	<div class="clear"></div>
	</div>
</body>
</html>


			
			
			<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
 <script type="text/javascript" language="javascript">
	function validate_form_fields()
{
 if($('#firtname').val() == '')
 {
  $('#e-mail').hide();
  $('#uname').hide();
  $('#passw').hide();
  $('#fsname').show();
  return false;
 }
 if($('#email').val() == '')
 {
  $('#fsname').hide();
  $('#uname').hide();
  $('#passw').hide();
  $('#e-mail').show();
  return false;
 }
 if($('#username').val() == '')
 { 
  $('#fsname').hide();
  $('#e-mail').hide();
  $('#passw').hide();
  $('#uname').show();
  return false;
 }
 
 if($('#pass').val() == '')
 {
  $('#fsname').hide();
  $('#e-mail').hide();
  $('#uname').hide();
  $('#passw').show();
  return false;
 }
}
</script>
