<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <h1>방 등록</h1>
  <form action="roomInsert" method="post">
    아이디<input type="text" name="host_id"><br>
    비밀번호<input type="password" name="host_pw"><br>
    이름<input type="text" name="host_name"><br>
    핸드폰<input type="text" name="host_phone"><br>
    이메일<input type="text" name="host_email"><br>
    <input type="submit" value="회원가입">
    <input type="reset" value="취소">
  </form>
</body>
</html>