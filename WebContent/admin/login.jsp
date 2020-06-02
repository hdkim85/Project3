<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>




<script>
	function loginValidate(fn){
		if(!fn.user_id.value){
			alert("아이디를 입력하세요");
			fn.user_id.focus();
			return false;
		}
		if(fn.user_pw.value==""){
			alert("패스워드를 입력하세요");
			fn.user_pw.focus();
			return false;
		}
	}
</script>




<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>SB Admin - Login</title>

  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Custom styles for this template-->
  <link href="css/sb-admin.css" rel="stylesheet">

</head>

<body class="bg-dark">

  <div class="container">
    <div class="card card-login mx-auto mt-5">
      <div class="card-header">Login</div>
      <div class="card-body">
        <form action="./common/LoginProcess.jsp">
          <div class="form-group">
            <div class="form-label-group">
              <input type="text" name="user_id" class="form-control" placeholder="Email address" required="required" autofocus="autofocus">
              <label for="user_id">id</label>
            </div>
          </div>
          <div class="form-group">
            <div class="form-label-group">
              <input type="password" name="user_pw" class="form-control" placeholder="Password" required="required">
              <label for="user_pw">Password</label>
            </div>
          </div>
          <div class="form-group">
            <div class="checkbox">
              <label>
                <input type="checkbox" name="id_save" value="remember-me">
                Remember Id
              </label>
            </div>
          </div>
          <button class="btn btn-primary btn-block">Login</button>
        </form>
        
      </div>
    </div>
  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

</body>

</html>
