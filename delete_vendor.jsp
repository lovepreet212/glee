<%if((session.getAttribute("name")==null))
{
response.sendRedirect("admin.jsp");
} 
%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@include file="header1.jsp" %>

	<!-- contact -->
	<div class="contact" id="mail">
		<div class="container">
			<div class="agile-heading">
				<h3>Select Vendor</h3>
			</div>
			<div class="agile-contact-form">	
                            <div class="col-md-4 col-sm-4 wow fadeInUp" data-wow-delay="0.9s">
                
                                    <img src="images/manage.jpg" style="width:300px;height:400px;border-radius: 20% "/> 
					
				</div>
				<div class="col-md-6 contact-form-right" style="margin: 10px;">
                  <%
                      Connection myconnection;
                      Class.forName("com.mysql.jdbc.Driver");
                      myconnection=DriverManager.getConnection("jdbc:mysql://localhost/glee", "root", "");
                      try
                      {
                          String q1="select * from vendor";
                          PreparedStatement mystatement1=myconnection.prepareStatement(q1);               
                          ResultSet rst = mystatement1.executeQuery();
                          if(rst.next())
                          {
                                do{ 
                              int sid = rst.getInt(2);
                              PreparedStatement p = myconnection.prepareStatement("select * from add_service where service_id='"+sid+"'");
                              //p.setInt(sid);
                              ResultSet rji  =p.executeQuery();
                              rji.next();
                                    
                              
                                    out.print("<div class='col-md-4' style='height:250px;'>"
                                            + "<a href=categorydetails.jsp?id="+ rst.getString("vendor_id")+" >"
                                          + "<img style='height:50px;' src='images/" + rst.getString("vendor_pic")+
                                          "' class='img img-responsive'></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href='delete_vendor0.jsp?cid="+rst.getInt(1) +"'>Edit</a> &nbsp;&nbsp;&nbsp; "
                                           +"<br/>Profession:" +rji.getString(2)+"</br>"+"Vendor name" +rst.getString("vendor_name") +"</div>");
                              }
                               while(rst.next());
                             
                          }
                          
                      }
                      catch(Exception e)
                      {
                          out.println("error in query" + e.getMessage());
                      }
                      finally
                      {
                          myconnection.close();
                      }
             %>
					
							
					
				</div>
				<div class="clearfix"> </div>
			</div>
			
			
		</div>
	</div>
	<!-- //contact -->
<%@include file="footer.jsp" %>