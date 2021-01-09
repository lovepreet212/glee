
<%if((session.getAttribute("name")==null))
{
response.sendRedirect("admin.jsp");
} 
%><%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
try{  
        String service=request.getParameter("service");
        
         
       Class.forName("com.mysql.jdbc.Driver");
   
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/glee","root","");
			PreparedStatement pstmt = con.prepareStatement("delete from add_service where service_name=?");
                        PreparedStatement ps = con.prepareStatement("delete from add_category where service_name=?");
                        PreparedStatement pst = con.prepareStatement("delete from add_subcategory where service_name=?");
                         pstmt.setString(1,service);
                         ps.setString(1,service);
                         pst.setString(1,service);
			
                
               if(pstmt.executeUpdate()>0)
                          {
                              request.setAttribute("msg2", "sucess");
                             request.getRequestDispatcher("Manage_service.jsp").forward(request, response);
                              //response.sendRedirect("Manage_service.jsp");
                          }
                          else{
                          out.print("Error");}
                          
                      if(ps.executeUpdate()>0)
                          {
                              response.sendRedirect("Manage_service.jsp");
                          }
                          else{
                          out.print("Error");}
                if(pst.executeUpdate()>0)
                          {
                              request.setAttribute("msg2", "sucess");
                             request.getRequestDispatcher("Manage_service.jsp").forward(request, response);
                              //response.sendRedirect("Manage_service.jsp");
                          }
                          else{
                          out.print("Error");}      
                          
                      }
      catch(Exception e)
        {
            out.print(e);
        }
    
                                                        %>