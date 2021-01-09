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
      String name="",email="",path,i="",img="",work="",address="";
      int sid = 0;
      long tid = 0l;
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
          
                    if(itemName1.equals("profession")) //control's name - textbox name
                    {
                            sid=Integer.parseInt(value);//variable name                
                    }
                    if(itemName1.equals("name")) //control's name - textbox name
                    {
                        name=value;//variable name                
                    }
                    if(itemName1.equals("email")) //control's name - textbox name
                    {
                            email=value;//variable name                
                    }
                    if(itemName1.equals("telephone")) //control's name - textbox name
                    {
                            tid=Long.parseLong(value);//variable name                
                    }
                    if(itemName1.equals("work")) //control's name - textbox name
                    {
                            work=value;//variable name                
                    }
                    if(itemName1.equals("address")) //control's name - textbox name
                    {
                            address=value;//variable name                
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
                         
                          PreparedStatement mystatement=myconnection.prepareStatement("insert into vendor(profession,vendor_name,vendor_email,vendor_phno,vendor_pic,vendor_wd,vendor_address,date,time,ip) values(?,?,?,?,?,?,?,?,?,?)");
                          mystatement.setInt(1,sid);
                          mystatement.setString(2,name);
                          mystatement.setString(3,email);
                          mystatement.setLong(4,tid);
                          mystatement.setString(5,i);
                          mystatement.setString(6,work);
                          mystatement.setString(7,address);
                          mystatement.setString(8,dt);
                          mystatement.setString(9,tim);
                          mystatement.setString(10,ip);                   
                          
                          
                          if(mystatement.executeUpdate()>0)
                          {request.setAttribute("msg1", "sucess");
                             request.getRequestDispatcher("Manage_vendor.jsp").forward(request, response);
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
             