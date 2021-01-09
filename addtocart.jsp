<%@page import="java.util.HashMap"%>
<%
int id = Integer.parseInt(request.getParameter("id"));
int cid = Integer.parseInt(request.getParameter("cid"));
HashMap<Integer,Integer> car;
if(session.getAttribute("cart")!=null )
    {
        car = (HashMap)  session.getAttribute("cart");
        if(car.containsKey(id))
        {
         car.replace(id, car.get(id)+1);
        }
        else{
            car.put(id, 1);
        }
        
    }
    else{
       car = new HashMap<Integer, Integer>();
car.put(id, 1);
    }
session.setAttribute("cart", car);
String url = "show_wrk.jsp?id="+cid;
response.sendRedirect(url);
%>