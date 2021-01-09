<%@include file="header1.jsp" %>
<%if((session.getAttribute("name")==null))
{
response.sendRedirect("admin.jsp");
} 
%>	<!-- contact -->
	<div class="contact" id="mail">
		<div class="container">
			<div class="agile-heading">
				<h3>Manage Tasks Here</h3>
			</div>
			<div class="agile-contact-form">
				<div class="col-md-6 contact-form-left">
					<div class="w3layouts-contact-form-top" >
					<img src="images/mg.jpg" style="width:450px;height:300px "/>	
					</div>
					
				</div>
				<div class="col-md-6 contact-form-right">
                                    <div class="agileinfo-contact-form-grid" style="border-radius:50px;height:20em;border:1px solid#000;font:'Trebuchet MS';background-color:buttonface;color:#333300;width:16em; margin:10px;padding:10px">
					<ul type="none"></br>
                                        <li><span class="glyphicon glyphicon-alert" style="margin-left:-30px;margin-right:30px;"></span><a href="Manage_service.jsp">Manage Service</a></li>
                                        <li><hr><span class="glyphicon glyphicon-alert" style="margin-left:-30px;margin-right:30px;"></span><a href="Manage_category.jsp">Manage Category</a></hr></li>
                                        <li><hr><span class="glyphicon glyphicon-alert" style="margin-left:-30px;margin-right:30px;"></span><a href="Manage_subcategory.jsp">Manage Sub-Category</a></hr></li>
                                       <li><hr><span class="glyphicon glyphicon-alert" style="margin-left:-30px;margin-right:30px;"></span><a href="Manage_work.jsp">Manage Work</a></hr></li>
                                        <li><hr><span class="glyphicon glyphicon-alert" style="margin-left:-30px;margin-right:30px;"></span><a href="Manage_vendor.jsp">Manage Vendor</a></hr></li>
                                      
                                       
                                        </ul>
							
					</div>
				</div>
				<div class="clearfix"> </div>
			</div>
			
			
		</div>
	</div>
	<!-- //contact -->
<%@include file="footer.jsp" %>