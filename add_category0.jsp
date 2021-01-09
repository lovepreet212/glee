<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.*"%>
<%@page import="org.apache.commons.fileupload.FileUploadException"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="java.util.*"%>
<%
           
  boolean isMultipart = ServletFileUpload.isMultipartContent(request);
  boolean flag=false;
      String service="",category="",path,i="",img="";
      int sid = 0;
      int ids=0;
      // Date Fetch
            java.util.Date d= new java.util.Date();
            SimpleDateFormat sdf = new SimpleDateFormat("dd/M/y");
            String dt  = sdf.format(d);
            
            // Time Fetch
            SimpleDateFormat sdf1 = new SimpleDateFormat("hh:m:s:a");
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
        } 
    if(isMultipart)
    {
        FileItem item=null;
        FileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);
			
        List items = null;
        try
        {
            items = upload.parseRequest(request);
        }
        catch(FileUploadException e)
        {
            e.printStackTrace();
        }
          Iterator itr = items.iterator();
		    
		  
          while (itr.hasNext())
            {

                    item = (FileItem) itr.next();
     
                if (item.isFormField())
                {
                    String itemName1 = item.getFieldName();
                    String value=item.getString();
          
                    if(itemName1.equals("service")) //control's name - textbox name
                    {
                            sid=Integer.parseInt(value);//variable name                
                    }
                    
                    if(itemName1.equals("category")) //control's name - textbox name
                    {
                            category=value;//variable name                
                    }
                }
                else
                {
                    String type=item.getContentType();
                    long size=item.getSize()/1024; //bytes
                    
                    if(size==0)
                    {
                        
                         
                        i = "default.jpg";
                       
			flag=true;
                    }
                    else if(type.equals("image/pjpeg") || type.equals("image/jpeg")
                        || type.equals("image/png") || type.equals("image/x-png")
                        || type.equals("image/gif") && size<400)
                    {
                       
                        i=new java.util.Date().getTime()+item.getName();
                        
 path=config.getServletContext().getRealPath("/") + "//images//" + i;
                        File savefile=new File(path);
                        
                        item.write(savefile);    
			flag=true;
                    }
		    else
		    {
			out.println("Please upload image files with size less than 400 kbs");
		    }
                    
                }
              
            } 
			if(flag)
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
                         
                          PreparedStatement mystatement=myconnection.prepareStatement("insert into add_category(service_id,category_name,category_pic,date,time,ip) values(?,?,?,?,?,?)");
                          mystatement.setInt(1,sid);
                          mystatement.setString(2,category);
                           mystatement.setString(3,i);
                           mystatement.setString(4,dt);
                          mystatement.setString(5,tim);
                           mystatement.setString(6,ip);
                                          
                          
                          
                          if(mystatement.executeUpdate()>0)
                          {
                             request.setAttribute("msg1", "sucess");
                             request.getRequestDispatcher("Manage_category.jsp").forward(request, response);
                             //response.sendRedirect("Manage_category.jsp");
                            
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
             