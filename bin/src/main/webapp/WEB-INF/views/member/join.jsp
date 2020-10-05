<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<form action="${pageContext.request.contextPath}/member/join" method="post">
 	아이디: <input type="text" name="userid" /><br/>
	암호: <input type="password" name="password"/><br/>
	이름: <input type="text" name="username"/><br/>
	생년월일(8자리 ex)19000000): <input type="text" name="birth" /><br/>
	연락처: <input type="text" name="phone"/><br/>
	성별: <select name="gender">
			<option value="m">남</option>
			<option value="f">여</option>
	</select>
	권한:<select name="role">
			<option value="USER">회원</option>
			<option value="ADMIN">관리자</option>
	</select>
	<input type="submit" value="회원가입" />
	</form>

</body>
</html>