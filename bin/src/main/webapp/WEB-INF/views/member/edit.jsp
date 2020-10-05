<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
</head>
<body>

	<div class="container">
		<form action="${pageContext.request.contextPath}/member/edit" method="post">
			id:	<input type="text" class="form-control" name="userid" value="${vo.userid}" readonly /><br/>
			password: <input type="password" class="form-control" name="password"/><br/>
			이름: <input type="text" class="form-control" name="username" value="${vo.username}" /><br/>
			생년월일(8자리 ex)19000000): <input type="text" class="form-control" name="birth" value="${vo.birth}"/><br/>
			연락처: <input type="text" class="form-control" name="phone" value="${vo.phone}"/><br/>
			성별: <select name="gender">
				<option value="m">남</option>
				<option value="f">여</option>
			</select>
			권한:<select name="role">
				<option value="USER">회원</option>
				<option value="ADMIN">관리자</option>
			</select>
			<input type="submit" class="btn btn-success" value="정보수정 " />
		</form>
	</div>
</body>
</html>