<%@include file="header1.jsp" %>
	<!-- contact -->
	<div class="contact" id="mail">
		<div class="container">
			<div class="agile-heading">
				<h3>Get In Touch</h3>
			</div>
			<div class="agile-contact-form">
                            
				<div class="col-md-6 contact-form-left">
			
                                    <div class="w3layouts-contact-form-top">
	<img src="images/home5.jpg" style="width:450px;height:300px "/>	
					</div>
					
				</div>
				<div class="col-md-6 contact-form-right">
		<%
                                if(request.getParameter("msg")!=null)
                                {
                                    out.print("<h2 class='alert alert-danger'>"+request.getParameter("msg")+"</h2>");
                                }
                            %>		
                                    <div class="contact-form-top">
						<h3>Sign In</h3>
					</div>
					<div class="agileinfo-contact-form-grid">
						<form action="admin0.jsp" method="post">
							<input type="text" class="form-control" name="name" placeholder="Name" required="">
							<input type="password" class="form-control" name="password" placeholder="Password" required="">
							<br/>
							<button class="btn btn-danger  col-md-4" name="submit">Submit</button>
						</form>
					</div>
				</div>
				<div class="clearfix"> </div>
			</div>
			
			
		</div>
	</div>
	<!-- //contact -->
<%@include file="footer.jsp" %>