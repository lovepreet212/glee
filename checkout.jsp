<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@include file="header.jsp" %>
<style>

	.immanu{
		width:100px !important; height:100px !important;
	}
</style>
           
<div class="row">
				<div class="col-md-1 col-md-offset-1"> Srno</div>
				  <div class="col-md-2 ">
					Item Name
				  </div>
				  
				   <div class="col-md-2">
    Product Pic				
               </div>
			  <div class="col-md-2">
				Quantity
			 </div> 
			 <div class="col-md-2">
					Price
			 </div> 
		<div class="col-md-2">
			Final Price
				  </div> 
			  </div>               
               
              
               <%
               int t=0,total=0;
    if(session.getAttribute("cart")!=null)
    {
    HashMap<Integer,Integer> car = (HashMap)  session.getAttribute("cart");
    for(Integer key: car.keySet())
    {
    int q =car.get(key);
    Connection myconnection;
    Class.forName("com.mysql.jdbc.Driver");
                      myconnection=DriverManager.getConnection("jdbc:mysql://localhost/glee", "root", "");
                      try
                      {
        String q1="select * from work where work_id='"+key+"' ";
                          PreparedStatement mystatement1=myconnection.prepareStatement(q1);               
                          ResultSet rst = mystatement1.executeQuery();
                          
                              if(rst.next())
                          { t++; 
                       %> <div class="row">
					<div class="col-md-1 col-md-offset-1">
						<%=t%>
					</div>
				  <div class="col-md-2 ">
					<%=rst.getString("work_kind")%>
				  </div>
				  
				   <div class="col-md-2">
					
               </div>
			  <div class="col-md-2">
					<h6>
					<form action="increase.jsp">
					<input type="hidden" value="<%=key%>" name="id"/>
					<input type="number" style="width:50px" 
                                               value="<%=q%>" name="cid"/><input type="submit" value="update">
					</form>
					</h6>
			 </div> 
			 <div class="col-md-2">
					<h2><%=rst.getString("work_charges")%></h2>
			 </div> 
		<div class="col-md-2">
                    <%
                    String charg = rst.getString("work_charges");
                    String finalchar="";
                    int priceq=0;
                    boolean flag;
                    if(charg.startsWith("Rs. "))
                    {   flag=true;
                    
                   String a[] = charg.split("Rs. ");
                     finalchar = a[1];
                     priceq= (Integer.parseInt(finalchar)*q);
                    }
                    else{ flag=false;}
                    %>
					<h2><% total += priceq ; 
        out.print(priceq); %></h2>
                    <a href='removit.php?x=<%=key%>'>
                        remove</a>
				  </div> 
			  </div> 
<%        
                          }
                          else{ %>
<div class="line">

	<div class="margin">
		<div class="s-12 l-7 margin-bottom">
		<%="<h2>No Item In cart </h2></div></div></div>"%>
	<%
}
                      }
                      
                      catch(Exception e){
                          out.print(e);
                      }
}
}
    else{
    out.print("No ITEM IN CART");
    }

%>
		<div class="line">

	<div class="margin">
		<div class="col-md-offset-5 col-md-2 margin-bottom">
					<br/><br/>
					<h2>Total</h2>
		  </div>
		  <div class="col-md-2 col-md-offset-3 margin-bottom">
                      
                      
			  
<%out.print("<a href='user_location.jsp' class='btn btn-danger l-5 mybtn'>Pay Now</a>");%>
							
				<h2><%=total%></h2>
                                <%
        session.setAttribute("totalprice", total);
                                %>
		  </div>
	</div>	<div class="clearfix"></div>
                        </div> </div>
        <div class="clearfix"></div>
	<!-- //contact -->
<%@include file="footer.jsp"%>

