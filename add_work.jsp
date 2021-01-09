<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@include file="header1.jsp" %>
<%
    if((session.getAttribute("name")==null))
{
response.sendRedirect("admin.jsp");
} 
%>
	<!-- contact -->
	<div class="contact" id="mail">
		<div class="container">
			<div class="agile-heading">
				<h3>Add Work</h3>
			</div>
			<div class="agile-contact-form">
				<div class="col-md-6 contact-form-left">
					<div class="col-md-4 col-sm-4 wow fadeInUp" data-wow-delay="0.6s" >
                            <img src="images/add.png" style="width:300px;height:400px "/>     
						
					</div>
					
				</div>
				<div class="col-md-6 contact-form-right">
					<div class="agileinfo-contact-form-grid">
						<form action="add_work0.jsp" method="post">
							Service<Select name="service" class="form-control" required="">
                                                        <option>Select Service</option>
                                                        <%
try{  
   
          
       Class.forName("com.mysql.jdbc.Driver");
   
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/glee","root","");
			PreparedStatement pstmt = con.prepareStatement("select * from add_service");
                         
			ResultSet rs = pstmt.executeQuery();
                
                while(rs.next()){
                    
			out.print("<option value='"+rs.getString("service_id")+"'>"+rs.getString("service_name")+"</option>");
           }
                
               
   }
      catch(Exception e)
        {
            out.print(e);
        }
    
                                                        %>
                                                        </select></br>
        Category<Select name="category" class="form-control" required="">
                                                        <option>Select Category</option>
                                                        <%
try{  
   
          
       Class.forName("com.mysql.jdbc.Driver");
   
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/glee","root","");
			PreparedStatement pstmt = con.prepareStatement("select * from add_category");
                         
			ResultSet rs = pstmt.executeQuery();
                
                while(rs.next()){
                    
			out.print("<option value='"+rs.getString("category_id")+"'>"+rs.getString("category_name")+"</option>");
           }
                
               
   }
      catch(Exception e)
        {
            out.print(e);
        }
    
                                                        %>
                                                        </select></br>
         Sub-Category<Select name="subcategory" class="form-control" required="">
                                                        <option>Select Sub-Category</option>
                                                        <%
try{  
   
          
       Class.forName("com.mysql.jdbc.Driver");
   
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/glee","root","");
			PreparedStatement pstmt = con.prepareStatement("select * from add_subcategory");
                         
			ResultSet rs = pstmt.executeQuery();
                
                while(rs.next()){
                    
			out.print("<option value='"+rs.getString("sub_id")+"'>"+rs.getString("subcategory_name")+"</option>");
           }
                
               
   }
      catch(Exception e)
        {
            out.print(e);
        }
    
                                                        %>
                                                        </select></br>                                                                             
                                                        Enter Work<input type="text" name="work" class="form-control" placeholder="Work" required="" >
                                                        Price(max.)<input type="text" name="price" class="form-control" placeholder="Work Charges" required="" >
                                                        Details<input type="text" name="detail" class="form-control" placeholder="Details"  >
                                                        Other Details<input type="text" name="other_detail" class="form-control" placeholder="Detail" required="" >
                                                       
							<button class="btn1">Submit</button>
						</form>
					</div>
				</div>
				<div class="clearfix"> </div>
			</div>
			
			
		</div>
	</div>
	<!-- //contact -->
<%@include file="footer.jsp" %>