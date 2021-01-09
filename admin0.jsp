<%@page import="java.text.SimpleDateFormat"%>
<%@include file="header.jsp" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%
    if(request.getParameter("submit")!=null){
   
 String name = request.getParameter("name");
 String password = request.getParameter("password");
 
   try{     
           
    
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/glee","root","");
            PreparedStatement ps = con.prepareStatement("select * from admin where username=? and password=?");
           	ps.setString(1,name);
	        ps.setString(2,password);
                
                ResultSet rs = ps.executeQuery();
                
                if(rs.next()){
                    session.setAttribute("name",name);
                   
                    
                     response.sendRedirect("category.jsp");}
                
                else{out.print("OOPS!Username and password doesn't match");
                    response.sendRedirect("admin.jsp");}
   }
      catch(Exception e)
        {
            out.print(e);
        }
    }
    
%> 