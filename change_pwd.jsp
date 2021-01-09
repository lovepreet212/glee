<%@include file="header.jsp" %>
	<!-- contact -->
	<div class="contact" id="mail">
		<div class="container">
			<div class="agile-heading">
                           <div class="agile-contact-form">
				<div class="col-md-6 contact-form-left">
					<div class="w3layouts-contact-form-top">
	<img src="images/home5.jpg" style="width:450px;height:300px "/>	
					</div>
					
				</div>
				<div class="col-md-6 contact-form-right">
					<div class="contact-form-top">
						 <h3>Enter your Email to proceed!</h3>
					</div>
					<div class="agileinfo-contact-form-grid" name="login">
						<form action="change_pwd0.jsp" method="post">
							Email<input type="email" class="form-control" name="email" placeholder="Enter your email" required="">
                                                        Password<input type="password" class="form-control" name="password" placeholder="Password" required="">
 							<br/>Re-Type Password<input type="password" class="form-control" name="re_password" placeholder="Re-type Password" required="">
                                                        <br/>
							<input type="submit" name="submit">
						</form>
					</div>
                                   
				</div>
				<div class="clearfix"> </div>
			</div>
			
			
		</div>
	</div>
	<!-- //contact -->
<%@include file="footer.jsp" %>