
<%if((session.getAttribute("name")==null))
{
response.sendRedirect("admin.jsp");
} 
%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
try{  
        String category=request.getParameter("category");
          
       Class.forName("com.mysql.jdbc.Driver");
   
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/glee","root","");
			PreparedStatement pstmt = con.prepareStatement("delete from add_category where category_name=?");
                        PreparedStatement ps = con.prepareStatement("delete from add_subcategory where category_name=?");
                           pstmt.setString(1,category);
                           ps.setString(1,category);
			
                
               if(pstmt.executeUpdate()>0)
                          {
                             request.setAttribute("msg2", "sucess");
                             request.getRequestDispatcher("Manage_category.jsp").forward(request, response);
                           //response.sendRedirect("Manage_category.jsp");
                              
                          }
                          else{
                          out.print("Error");}
              if(ps.executeUpdate()>0)
                          {
                             request.setAttribute("msg2", "sucess");
                             request.getRequestDispatcher("Manage_category.jsp").forward(request, response);
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