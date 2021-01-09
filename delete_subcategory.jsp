<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
				<h3>Delete SubCategory</h3>
			</div>
			<div class="agile-contact-form">
				<div class="col-md-6 contact-form-left">
			<div class="col-md-4 col-sm-4 wow fadeInUp" data-wow-delay="0.9s">
					<img src="images/delete-button.jpg" style="width:300px;height:400px "/>		
						
					</div>
					
				</div>
				<div class="col-md-6 contact-form-right">
					<div class="agileinfo-contact-form-grid">
						<form action="delete_subcategory0.jsp" method="post">
							Sub-Category<Select name="subcategory" class="form-control" required="">
                                                        <option>Select Sub-Category</option>
                                                        <%
try{  
   
          
       Class.forName("com.mysql.jdbc.Driver");
   
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/glee","root","");
			PreparedStatement pstmt = con.prepareStatement("select * from add_subcategory");
                         
			ResultSet rs = pstmt.executeQuery();
                
                while(rs.next()){
                    
			out.print("<option>"+rs.getString("subcategory_name")+"</option>");
           }
                
               
   }
      catch(Exception e)
        {
            out.print(e);
        }
    
                                                        %>
                                                        </select></br>
                                                        
							<button class="btn1">Delete</button>
						</form>
					</div>
				</div>
				<div class="clearfix"> </div>
			</div>
			
			
		</div>
	</div>
	<!-- //contact -->
<%@include file="footer.jsp" %>