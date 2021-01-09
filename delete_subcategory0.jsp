
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
        String subcategory=request.getParameter("subcategory");
          
       Class.forName("com.mysql.jdbc.Driver");
   
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/glee","root","");
			PreparedStatement pstmt = con.prepareStatement("delete from add_subcategory where subcategory_name=?");
                           pstmt.setString(1,subcategory);
			
                
               if(pstmt.executeUpdate()>0)
                          {
                             request.setAttribute("msg2", "sucess");
                             request.getRequestDispatcher("Manage_subcategory.jsp").forward(request, response);
                           //response.sendRedirect("Manage_category.jsp");
                              
                          }
                          else{
                          out.print("Error");}
                          
                      }
                      
      catch(Exception e)
        {
            out.print(e);
        }
    
                                                    %>    