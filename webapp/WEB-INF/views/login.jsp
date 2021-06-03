<%@ page pageEncoding="UTF-8"%>

<h2>로그인</h2>
<form name="loginfrm" id="loginfrm" method="post">
    <div>
        <label for="userid">아이디</label>
        <input type="text" name="userid" id="userid">
    </div>
    <div>
        <label for="passwd">비밀번호</label>
        <input type="password" name="passwd" id="passwd">
    </div>
    <div>
    <button type="button" id="loginbtn">로그인</button>
    </div>
</form>

<script>
var loginbtn = document.getElementById('loginbtn');
loginbtn.addEventListener('click', loginok);

function loginok() {
	var frm = document.getElementById('loginfrm');
	if(frm.userid.value == '')
		alert('아이디를 입력하세요!');
	else if(frm.passwd.value=='')
		alert('비밀번호를 입력하세요!');
	else {
		frm.action = 'loginok.jsp';
		frm.submit();
	}
}
</script>