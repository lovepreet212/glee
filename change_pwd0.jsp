
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%  
    if(request.getParameter("submit")!=null){
 String email= String.valueOf(session.getAttribute("email"));
 String password = request.getParameter("password");
 String repassword= request.getParameter("re_password");
 if(password.equals(repassword)) {
 
   try{     
           
    
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/glee","root","");
            PreparedStatement ps = con.prepareStatement("update  u_register set u_password='"+password+"' where u_email='"+email+"'");
            //  out.print("update  u_register set u_password='"+password+"' where u_email='"+email+"'");    
                
               int k= ps.executeUpdate();
                
                if(k>0){
                  out.print("password changed");
                   
                    
                    //response.sendRedirect("change_pwd.jsp");
                }
                
                else{//out.print("OOPS!Username and password doesn't match");
                    response.sendRedirect("u_forgetpwd.jsp");}
   }
      catch(Exception e)
        {
            out.print(e);
        }
    }
 else{
     out.println("Sorry Password and Con not match");
 }
    }
    
%>
