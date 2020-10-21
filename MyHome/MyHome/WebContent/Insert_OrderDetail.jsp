<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="myhomereal.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%
 	request.setCharacterEncoding("utf-8");
   	 	
	ArrayList<String> category = (ArrayList<String>)session.getAttribute("categoryList"); 
	ArrayList<String> name = (ArrayList<String>)session.getAttribute("nameList");
	ArrayList<String> price = (ArrayList<String>)session.getAttribute("priceList");
   	
   	String ordername = (String)session.getAttribute("ordername"); 
   	String userId = (String)session.getAttribute("userId"); 
   	String phonenum = (String)session.getAttribute("orderphonenum");
   	String mail = (String)session.getAttribute("ordermail");
   	String address = (String)session.getAttribute("orderaddress");
   	
   	String a ="test";
   	
    int random = (int)Math.floor(Math.random() * 100) + 1;
    String torandom = Integer.toString(random);
    String ordercode = torandom;
    
     	MyHomeRealDAO dao = new MyHomeRealDAOImpl();     	
     	MyHomeOrderListVO ovo = new MyHomeOrderListVO(Long.parseLong(ordercode), ordername, userId, phonenum, mail, address);
     	     	
		boolean test = dao.orderList_insert(ovo);
   		
   		if(test) {
   			System.out.println("추가함1");
   		}
   		else {
   			System.out.println("못 추가함");
   		}
   		
   		for(int i=0; i< category.size();i++) {
   			String oc = category.get(i);
   			String on = name.get(i);
   			String op = price.get(i);
   			//System.out.println(oc);
   			MyHomeOrderDetailVO vo = new MyHomeOrderDetailVO(Long.parseLong(ordercode), oc, on, Long.parseLong(op));
   			test = dao.orderDetail_insert(vo);
   			
   			if(test) {
   	   			System.out.println("추가함1");
   	   		}
   	   		else {
   	   			System.out.println("못 추가함");
   	   		}
   		}   			
   		
   		
   	response.sendRedirect("Delivery_page.jsp");
%>
