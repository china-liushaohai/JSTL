/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package src;

/**
 *
 * @author Admin
 */
public class UserBean {
    
    private String username;
    private String password;
    private String firstName;
    private String lastName;
    public boolean valid;
    private int counter;

    public String getFirstName() {
         return firstName;
    }

    public void setFirstName(String FirstName) {
         this.firstName = FirstName;
    }
    
    public String getLastName() {
         return lastName;
    }

    public void setLastName(String LastName) {
         this.lastName = LastName;
    }
			
    public String getPassword() {
         return password;
    }

    public void setPassword(String Password) {
         this.password = Password;
    }
	
    public String getUsername() {
         return username;
    }

    public void setUserName(String newUsername) {
         this.username = newUsername;
    }

    boolean isValid() {
         return valid;
    }

    public void setValid(boolean Valid) {
        this.valid = Valid;
    }	
      
    public void incCount(int counter){
          this.counter = counter;
    }
    
    public int getCount(){
        return counter;
    }
    
    public UserBean() {
        
    }
    
}
