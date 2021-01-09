<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
           
      int sid=Integer.parseInt(request.getParameter("service"));
      String work=request.getParameter("work");
      String price=request.getParameter("price");
      String details=request.getParameter("detail");
      String other_detail=request.getParameter("other_detail");
      int cid =Integer.parseInt(request.getParameter("category")); 
      int subcat=Integer.parseInt(request.getParameter("subcategory"));
      
      // Date Fetch
            java.util.Date d= new java.util.Date();
            SimpleDateFormat sdf = new SimpleDateFormat("dd/M/y");
            String dt  = sdf.format(d);
            
            // Time Fetch
            SimpleDateFormat  sdf1 = new SimpleDateFormat("hh:m:s:a");
            String tim = sdf1.format(d);
            
            // IP
             String ip = request.getHeader("X-Forwarded-For");  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = request.getHeader("Proxy-Client-IP");  
        }  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = request.getHeader("WL-Proxy-Client-IP");  
        }  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = request.getHeader("HTTP_CLIENT_IP");  
        }  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = request.getHeader("HTTP_X_FORWARDED_FOR");  
        }  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = request.getRemoteAddr();  
    
			{
		   
                  String url="jdbc:mysql://localhost/glee";                  
                  String username2="root";
                  String password2="";
                  
                  try
                  {
                      Connection myconnection;
                      Class.forName("com.mysql.jdbc.Driver");
                      //ids = Integer.parseInt(request.getParameter("ids"));
                      myconnection=DriverManager.getConnection(url, username2, password2);
                      try
                      {
                         
                          PreparedStatement mystatement=myconnection.prepareStatement("insert into work(service_id,category_id,sub_id,work_kind,date,time,ip,work_charges,detail,other_details) values(?,?,?,?,?,?,?,?,?,?)");
                          mystatement.setInt(1,sid);
                          mystatement.setInt(2,cid);
                          mystatement.setInt(3,subcat);
                          mystatement.setString(4,work);
                          mystatement.setString(5,dt);
                          mystatement.setString(6,tim);
                          mystatement.setString(7,ip);
                          mystatement.setString(8,price);
                          mystatement.setString(9,details);
                          mystatement.setString(10,other_detail);
                          
                          
                          
                          if(mystatement.executeUpdate()>0)
                          {  
                             request.setAttribute("msg1", "sucess");
                             request.getRequestDispatcher("Manage_work.jsp").forward(request, response);
                             //out.print("values inserted");
                          }
                          else{
                          out.print("Error");}
                          
                      }
                      catch(Exception e)
                      {
                          out.println("error in query" + e.getMessage());
                      }
                      finally
                      {
                          myconnection.close();
                      }
                  }
                  catch(Exception e)
                  {
                      out.println("Error in Connection Here " + e.getMessage());
                      e.printStackTrace();
                  }
                  
                            
                            
                            
			}
					
        } 
    
                
           
              %>
             