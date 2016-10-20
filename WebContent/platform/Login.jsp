<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.*" %>
<%@page import="java.text.SimpleDateFormat"%> 
<%@ include file="header.html" %>	

<body id="login">

    <!--login modal-->
    <div id="loginModal" class="show container" tabindex="-1" role="dialog" aria-hidden="true">
    
        <div class="alert alert-danger alert-dismissible" role="alert" id="loginAlert">
          <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <strong>Warning!</strong> Authentication Failed
        </div>
        
      <div class="modal-dialog">
      <div class="modal-content">
      	
          <div class="modal-header">
              <h1>
              	<img src="../images/icon.png" alt="NTU logo" id="loginLogo" />
                Login SSPPP Portal
              </h1>
          </div>
          <div class="modal-body">
              
                <div class="form-group">
                  <input type="text" class="form-control input-lg" placeholder="Email" id="loginID" value="">
                </div>
                <div class="form-group">
                  <input type="password" class="form-control input-lg" placeholder="Password" id="loginPassword" value="">
                </div>
                <div class="form-group">
                 	<select class="form-control" id="loginRole">
                    	<option value="Student">Student</option>
                        <option value="Staff">Staff</option>
                        <option value="Assoc">Assoc</option>
                        <option value="Supplier">Supplier</option>
                    </select>
                </div>
                <div class="form-group">
                  <button class="btn btn-primary btn-lg btn-block" id="submitLogin">Sign In</button>
                  <br/>
                  <span class="pull-right"><a href="#">Forget Password</a></span>
                </div>
  
          </div>
          <div class="modal-footer">
          </div>
      </div>
      </div>
    </div> <!-- end login modal-->

 <%@ include file="footer.html" %>	