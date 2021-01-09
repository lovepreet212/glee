<%@include file="header1.jsp" %>
<%if((session.getAttribute("name")==null))
{
response.sendRedirect("admin.jsp?msg=Please login");
} 
%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<div class="contact" id="mail">
		<div class="container">
			<div class="agile-heading">
				<h3>All Orders</h3>
			</div>
			<div class="agile-contact-form">
				
				<div class="col-md-12" >
<%
try{  
   
          
       Class.forName("com.mysql.jdbc.Driver");
   
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/glee","root","");
                        PreparedStatement pstmt = con.prepareStatement("select * from `order`");
                         
			ResultSet rs = pstmt.executeQuery();
                
                 out.print("<table class='table table-responsive'>");
                 out.print("<tr class='bg-primary'>");
                              out.print("<td>Order Id</td>");
                              out.print("<td>Address</td>");
                              out.print("<td>ContactNo</td>");
                              out.print("<td>Products</td>");
                              out.print("<td>Status</td>");
                              out.print("<td>Payment By</td>");
                              out.print("<td>User Id</td>");
                              out.print("<td>Price Paid</td>");
                              out.print("<td>Date</td>");
                              out.print("<td>Time</td>");
                              out.print("</tr>");
                          while(rs.next())
                          {
                              out.print("<tr>");
                              out.print("<td>"+rs.getInt(1)+"</td>");
                              int aid = rs.getInt(2);
                                    PreparedStatement p = con.prepareStatement("se"
                                      + "lect * from user_location where location_id='"+aid+"'");
                                    ResultSet rji  =p.executeQuery();
                                    rji.next();   
                                    out.print("<td>"+rji.getString(3)+"-"+rji.getString(2) +"</td>");
                                    out.print("<td>"+rji.getString(4) +"</td><td>");
                                     
                               String pid = rs.getString("products");
                                    String arry[] = pid.split(",");
                                    out.print("<select class='form-control'>");
                                    for(String x : arry)
                                    {
                                        PreparedStatement mystatement2=con.prepareStatement("s"
                                                + "elect * from work where work_id='"+x+"'");               
                                   ResultSet rst2 = mystatement2.executeQuery();
                                     if(rst2.next())
                                     {
                                         out.print("<option>"+rst2.getString(5)+"</option>");
                                     }
                                    }
                                    out.print("</select></td>");
                                out.print("<td>"+rs.getString(4)+"</td>");
                                out.print("<td>"+rs.getString(5)+"</td>");
                                out.print("<td>"+rs.getString(6)+"</td>");
                                out.print("<td>"+rs.getString(10)+"</td>");
                                out.print("<td>"+rs.getString(7)+"</td>");  
                                out.print("<td>"+rs.getString(8)+"</td>");  
                                       out.print("</tr>");
                                   }
                                   out.print("</table>");
                
               
   }
      catch(Exception e)
        {
            out.print(e);
        }
    
                                                        %>
                                                        </div>
				<div class="clearfix"> </div>
			</div>
			
			
		</div>
	</div>
	<!-- //contact -->
<%@include file="footer.jsp" %>