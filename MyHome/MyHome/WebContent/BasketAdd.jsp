<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="myhomereal.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%int sum=0; %>
<%

	 request.setCharacterEncoding("utf-8");
	 
	 String gategory = request.getParameter("category"); 
	 ArrayList<String> alist1 = new ArrayList<String>();
	 alist1.add(gategory);
	 out.println(alist1);
	 session.setAttribute("categoryList", alist1);
	 
	 System.out.println(gategory);
	 
	 
	 String name = request.getParameter("name"); 
	 //ArrayList alist2 = (ArrayList)session.getAttribute("nameList");
	 ArrayList<String> alist2 = new ArrayList<String>();
	 alist2.add(name);
	 out.println(alist2);
	 session.setAttribute("nameList", alist2); 
	
	 
	 String price = request.getParameter("price"); 
	 ArrayList<String> alist3 = new ArrayList<String>();
	 alist3.add(price);
	 out.println(price);
	 session.setAttribute("priceList", alist3);
	 
	int iprice = Integer.parseInt(price);   
	sum = (sum+iprice);     
	 String totalsum = Integer.toString(sum);
	 session.setAttribute("totalsum",totalsum);
	 
	response.sendRedirect("buy_product.jsp");
%>




<%--
   int sum = 0;
   request.setCharacterEncoding("utf-8");
   
   String category = request.getParameter("category");
   String name = request.getParameter("name");
   String price = request.getParameter("price");
   
   int sum = 0;
   int iprice = Integer.parseInt(price);   
   sum = (sum+iprice);     
   String totalsum = Integer.toString(sum);
   session.setAttribute("totalsum",totalsum);
   
   session.setAttribute("category",category);
   session.setAttribute("name",name);
   session.setAttribute("price",price);
   session.setAttribute("totalsum",totalsum);
   
   response.sendRedirect("buy_product.jsp");
   
   
--%> 