<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@include file="header1.jsp" %>
<script>
function mail(){
    var e=document.getElementById("email").value;
    var patt=/^[a-zA-Z0-9]\.\-\_+\@+[a-zA-Z0-9]+\.+[a-zA-Z]{2,3}$/;
    if(!patt.test("email")){
        alert("Please enter a valid email!");
        return false;
    }
    else{
        return true;
    }

}
function mobile(){
    var e=document.getElementById("phno").value;
    var patt=/^[0-9]{10}$/;
    if(!patt.test("phno")){
        alert("Please enter a valid phone number!");
        return false;
    }
    else{
        return true;
    }

}
</script>
	<!-- contact -->
	<div class="contact" id="mail">
		<div class="container">
			<div class="agile-heading">
				<h3>Add Vendor</h3>
			</div>
			<div class="agile-contact-form">
				<div class="col-md-6 contact-form-left">
			        <div class="col-md-4 col-sm-4 wow fadeInUp" data-wow-delay="0.6s" >
                                <img src="images/add.png" style="width:300px;height:400px "/>     
				</div>
				</div>
				<div class="col-md-6 contact-form-right">
				<div class="agileinfo-contact-form-grid">
				<form action="add_vendor0.jsp" method="post" enctype="multipart/form-data">
                                Profession<Select name="profession" class="form-control" required="">
                                <option>Select Your Profession</option>
                                <%
try{  
   
          
       Class.forName("com.mysql.jdbc.Driver");
       Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/glee","root","");
       PreparedStatement pstmt = con.prepareStatement("select * from add_service");
       ResultSet rs = pstmt.executeQuery();
       while(rs.next()){
          out.print("<option value='"+rs.getString("service_id")+"'>"+rs.getString("service_name")+"</option>");
           }
        }
      catch(Exception e)
        {
            out.print(e);
        }
    
      %>
                                                        </select></br>
                                                      Name<input type="text" name="name" placeholder="Name" required="">
                                                      Email<input type="email" name="email" id="email" placeholder="Email" required="" onblur="mail();">
                                                      Telephone<input type="text" name="telephone" id="phno" placeholder="Telephone" required="" onblur="mobile();">
                                                      Profile Pic<input type="file" class="form-control" name="file" style="height: 40px" required="">
					              Work Description<textarea name="work" placeholder="Work Description" required=""></textarea>
                                                      Address<textarea name="address" placeholder="Address" required=""></textarea>
						      <button class="btn1">Submit</button>
						</form>
					</div>
				</div>
				<div class="clearfix"> </div>
			</div>
			
			
		</div>
	</div>
	<!-- //contact -->
<%@include file="footer.jsp" %>