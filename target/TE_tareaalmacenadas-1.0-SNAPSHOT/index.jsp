<%@page import="java.util.ArrayList"%>
<%@page import="com.emergentes.modelo.Tarea"%>
<%
    if(session.getAttribute("tareaalm") == null){
        ArrayList<Tarea>lisaux=new ArrayList<Tarea>();
        session.setAttribute("tareaalm",lisaux);
    }
    ArrayList<Tarea> lista = (ArrayList<Tarea>) session.getAttribute("tareaalm");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Gestor de tareas</h1>
        <h3>Nombre: Neyda Zulema Condori Tarqui</h3>
        <a href="MainServlet?op=nuevo">Nuevo</a><!-- comment -->
        <table border="1" bgcolor="silver">
            <tr>
                <th>Id</th>
                <th>Tarea</th><!-- comment -->
                <th>Completado</th>  
                <th></th>
            </tr>   
            <%
                if(lista != null){
                    for(Tarea item :lista){
            %>
            <tr>
                <td><%= item.getId() %></td>
                <td><%= item.getTarea() %></td><!-- comment -->
                <td>
                    <a href="MainServlet?op=completado&id=<%= item.getId() %>">
                        <input type="checkbox"></a>  
                <td>
                    <a href="MainServlet?op=editar&id=<%= item.getId() %>">Editar</a>
                
                    <a href="MainServlet?op=eliminar&id=<%= item.getId() %>"onclick
                       ="return(confirm('Esta seguro de eliminar??'))">Eliminar</a>
                </td>
            </tr>
            <%
                }
            }
            %>
        </table>
    </body>
</html>
