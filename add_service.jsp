<%@include file="header1.jsp" %>
<%if((session.getAttribute("name")==null))
{
response.sendRedirect("admin.jsp");
} 
%>
	<!-- contact -->
	<div class="contact" id="mail">
		<div class="container">
			<div class="agile-heading">
				<h3>Add Service Here</h3>
			</div>
			<div class="agile-contact-form">
                            <div class="col-md-4 col-sm-4 wow fadeInUp" data-wow-delay="0.6s" >
                            <img src="images/add.png" style="width:300px;height:400px "/>         
			     </div>
				<div class="col-md-6 contact-form-right">
					<div class="agileinfo-contact-form-grid">
						<form action="add_service0.jsp" method="post" enctype="multipart/form-data">
							Service Name<input type="text" class="form-control" name="service" placeholder="Enter Service" required="">
							Select Image<input type="file" class="form-control" name="file" style="height: 40px">
					</br>
							
							<button class="btn1" name="enter" class="form-control">Submit</button>
                                                        
						</form>
					</div>
				</div>
				<div class="clearfix"> </div>
			</div>
			
			
		</div>
	</div>
	<!-- //contact -->
<%@include file="footer.jsp" %>