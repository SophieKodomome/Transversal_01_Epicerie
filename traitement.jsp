<%@ page import="connect.*" %>
<%@ page import="mesclass.*" %>
<%@ page import="java.sql.*" %> 

<%

Connection conn=new Connect().connectit("epicerie", "epicerie", "epicerie");

try {
String pdt = request.getParameter("produit");
String[] catego = request.getParameterValues("checkbox");
int t = Integer.valueOf(request.getParameter("type"));
int price = Integer.valueOf(request.getParameter("prix"));
String d = request.getParameter("date");

int[] cat=new int[catego.length];
int c=0;
for(int i=0; i<catego.length;i++){
    if("standard".equals(catego[i])){
        cat[c]=1;
        c++;
    }
    if("moyenne".equals(catego[i])){
        cat[c]=2;
        c++;
    } 
    if("luxe".equals(catego[i])){
        cat[c]=3;
        c++;
    }

}

out.println(cat.length);

Produit p = new Produit();
for(int a=0; a<cat.length; a++){
    try{
        out.println(cat[a]);
            p.insertProduit(conn,pdt,price,d,t,cat[a]);
    }
    catch(Exception e){
        e.printStackTrace();
    }
}
    } catch (Exception e) {
        e.printStackTrace();  
    } finally {r
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    
   response.sendRedirect("admin.jsp");
%>