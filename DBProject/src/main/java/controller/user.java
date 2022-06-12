package controller;
import java.sql.*;

public class user {

    private int id;
    private String username;
    private String email;
    private String password;
    private String mobile;

    private String profile;
    
    public user(int id, String username, String email, String password, String mobile, String profile) {
	this.id = id;
	this.username = username;
	this.email = email;
	this.password = password;
	this.mobile = mobile;
	this.profile = profile;
    }
    
    public user(){
    }
    
    public user (String name, String email, String password, String mobile, String profile) {
	this.username = name;
	this.email = email;
	this.password = password;
	this.mobile = mobile;
	this.profile = profile;
    }
    
    //getters and setters
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getName() {
        return username;
    }
    public void setName(String name) {
        this.username = name;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public String getMobile() {
        return mobile;
    }
    public void setMobile(String mobile) {
        this.mobile = mobile;
    }
    public String getProfile() {
        return profile;
    }
    public void setProfile(String profile) {
        this.profile = profile;
    }
    
}
