package src;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

/**
 *
 * @author Admin
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {
    
    public int counter = 0;
    
    @Resource(lookup="jdbc/itm515DS")
    DataSource defaultDS;
    
    public LoginServlet(){
        
    }

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    /*
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. 
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } finally {            
            out.close();
        }
    }
*/
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        //processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        counter++;
        try {
            UserBean user = new UserBean();
            user.setUserName(request.getParameter("userName").trim());
            user.setPassword(request.getParameter("password").trim());
            
            Connection cnx = defaultDS.getConnection();
            Statement st = cnx.createStatement();
            String query = "select * from login.listuser where user_id='"
                     + user.getUsername()
                     +"' or passwd='"  
                     + user.getPassword()+"'";
            
            ResultSet rs=st.executeQuery(query); 
           
            if(rs.next()){
                HttpSession session = request.getSession(true);
                if(rs.getString("user_id").equals(user.getUsername())
                        && rs.getString("passwd").equals(user.getPassword())){
                    // Successful
                    
                    session.setAttribute("currentUser", user);
                    response.sendRedirect("success.jsp");
                    //System.out.println("am here 2");
                }else if(rs.getString("user_id").equals(user.getUsername())
                        && !rs.getString("passwd").equals(user.getPassword())){
                    //
                    if(counter>1){
                        response.sendRedirect("recover.jsp");
                        //response.sendRedirect("index.jsp?msg=Click forgot password to recover !!"); 
                    }else{
                        response.sendRedirect("index.jsp?msg=Invalid Password !!");
                    }
                }else{
                    //Fail
                    response.sendRedirect("index.jsp?msg=Wrong Credentails !!");
                }
            }
            
            rs.close();
            st.close();
            cnx.close();
          //  user = UserDAO.login(user);

            //if (user.isValid()) { request.getSession(true);
              //  session.setAttribute("currentSessionUser", user);
               // response.sendRedirect(

              //HttpSession session ="index.jsp"); //logged-in page        		
            //} else {
            //   response.sendRedirect("invalidLogin.jsp"); //error page 
            //}
        } catch (Throwable Exception) {
            System.out.println("exception caught is:" +Exception);
        }
        //processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
