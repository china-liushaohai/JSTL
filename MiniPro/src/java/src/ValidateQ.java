/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package src;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.StringTokenizer;
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
@WebServlet(name = "ValidateQ", urlPatterns = {"/ValidateQ"})
public class ValidateQ extends HttpServlet {

    @Resource(lookup = "jdbc/itm515DS")
    DataSource defaultDS;

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
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
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
        try {
            UserBean user = new UserBean();
            StringBuilder sb = new StringBuilder();
            sb.append("select passwd from login.listuser where ");

            Connection cnx = defaultDS.getConnection();
            Statement st = cnx.createStatement();
            ResultSet rs = null;

            String fromDate = request.getParameter("dob");
            String bCity = request.getParameter("bCity");
            String mName = request.getParameter("mName");
            String uName = request.getParameter("");
            String pwd = null;

            if (fromDate != null) {
                System.out.println("DOB" + fromDate);

                //9/16/2012 
                //2012-16-09	INFO: DOB2012-09-17
                SimpleDateFormat fromFormat = new SimpleDateFormat("yyyy-mm-dd");
                SimpleDateFormat toFormat = new SimpleDateFormat("yyyy-dd-mm");

                Date date = fromFormat.parse(fromDate);
                String toDate = toFormat.format(date);
                System.out.println("toDate" + toDate);

                sb.append("Q1_DOB = '").append(toDate).append("'");
                rs = st.executeQuery(sb.toString());
                if (rs.next()) {
                    pwd = rs.getString("passwd");
                    System.out.println("pwd is 1:" + rs.getString("passwd"));
                }
                
            } else if (bCity != null) {
                System.out.println("bCity " + bCity);

                sb.append("Q2_CITY = '").append(bCity).append("'");
                rs = st.executeQuery(sb.toString());
                if (rs.next()) {
                    pwd = rs.getString("passwd");
                    System.out.println("pwd is 2:" + rs.getString("passwd"));
                }

            } else if (mName != null) {
                System.out.println("mName " + mName);

                sb.append("Q3_NAME = '").append(mName).append("'");
                rs = st.executeQuery(sb.toString());
                if (rs.next()) {
                    pwd = rs.getString("passwd");
                    System.out.println("pwd is 3:" + rs.getString("passwd"));
                }

            }
            
            if(pwd!=null){
               response.sendRedirect("recover.jsp?msg=your password is :"+pwd
                  +" Please sign-in again"); 
            }else{
                response.sendRedirect("recover.jsp?msg=Input provided is incorrect."
                        + "Please retry!");
            }
            System.out.println("Query is" + sb.toString());
            sb.setLength(0);
            
            if (rs != null) {
                rs.close();
            }
            if (st != null) {
                st.close();
            }
            if ( cnx != null){
             cnx.close();
            }
            /*
             user.setUserName(request.getParameter("userName").trim());
             user.setPassword(request.getParameter("password").trim());
            
            
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
             response.sendRedirect("");
             //response.sendRedirect("index.jsp?msg=Click forgot password to recover !!"); 
             }else{
             response.sendRedirect("index.jsp?msg=Invalid Password !!");
             }
             }else{
             //Fail
             response.sendRedirect("index.jsp?msg=Wrong Credentails !!");
             }
             }
             */

        } catch (Throwable Exception) {
            System.out.println("exception caught is:" + Exception);
        }
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
