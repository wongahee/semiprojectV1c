<%@ page pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>성적처리결과</title>
</head>
<body>
	<h1>성적처리결과</h1>
	<p>이름 : ${sj.name} </p>
	<p>국어 : ${sj.kor} </p>
	<p>영어 : ${sj.eng} </p>
	<p>수학 : ${sj.mat} </p>
	<p>총점 : ${sj.tot} </p>
	<p>평균 : ${sj.avg} </p>
</body>
</html>