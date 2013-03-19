/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package src;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import java.io.IOException;
import javax.annotation.Resource;
 
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;
import javax.sql.DataSource;
 
public class CheckTagHandler extends TagSupport {
    @Resource(lookup = "jdbc/itm515DS")
    DataSource defaultDS;
    
    private String input;
    private int start;
    private int end;
    
    public String getInput() {
        return input;
    }
    public void setInput(String input) {
        this.input = input;
    }
     
    @Override
    public int doStartTag() throws JspException {
   try {
            JspWriter out = pageContext.getOut();
            Connection cnx = defaultDS.getConnection();
            Statement st = cnx.createStatement();
            
            String query = "select count(*) as cnt from login.listuser where user_id='"
                    + this.input + "'";
            System.out.println("Am here"+query);
            ResultSet rs = st.executeQuery(query);
            if(rs.next()){
                if (rs.getInt("cnt") > 0) {
                       out.println("User already exists!");
                    System.out.println("User already exists!");
                 }
                System.out.println("==>"+query);
            }

        } catch (Throwable Exception) {
            System.out.println("exception caught is:" + Exception);
        }

        return SKIP_BODY;
    }

    
}