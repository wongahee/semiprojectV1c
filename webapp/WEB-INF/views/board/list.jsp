<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<fmt:setBundle basename="gahee.jdbc" />
<fmt:message key="url" var="url" />
<fmt:message key="drv" var="drv" />
<fmt:message key="usr" var="usr" />
<fmt:message key="pwd" var="pwd" />

<sql:setDataSource var="mariadb"
	url="${url}" driver="${drv}" user="${usr}" password="${pwd}" />

<sql:query dataSource="${mariadb}" var="rs">
	select bdno,title,userid,regdate,views
	from board
	order by bdno desc;
</sql:query>

<h2>게시판</h2>
<table id="list">
    <colgroup><!-- 테이블 컬럼 스타일 정의 -->
        <col style = "width: 10%">
        <col style = "">
        <col style = "width: 15%">
        <col style = "width: 15%">
        <col style = "width: 10%">
    </colgroup>
    <thead>
    <tr>
        <td colspan="5" class="newbtn">
        
        <c:if test="${not empty sessionScope.userid}">
        	<button type="button" id="newbtn">글쓰기</button>
        </c:if>
        <c:if test="${empty sessionScope.userid}">
        	&nbsp;
        </c:if>
        </td>
    </tr>
    <tr>
        <th>번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>작성일</th>
        <th>조회</th>
    </tr></thead>
    <tbody>
     <c:forEach var="r" items="${rs.rows}" varStatus="no">
     	<tr><td>${no.count}</td>
          <td><a href="/mvc/board/view?bdno=${r.bdno}">${r.title}</a></td>
          <td>${r.userid}</td>
          <td>${fn:substring(r.regdate,0,10)}</td>
          <td>${r.views}</td></tr>
     </c:forEach>
        </tbody>
        <tfoot>
            <tr>
                <td colspan = "5" class = "tbnav">
                    <span> ◁ ◀◀ <span class = "cpage">1</span> 2 3 4 5 6 7 8 9 10 ▶▶ ▷</span>
                </td>
            </tr>
        </tfoot>
    </table>

<script>
	var newbtn = document.getElementById('newbtn');
	newbtn.addEventListener('click', go2write);
	
	function go2write() {
		location.href='/board/write.jsp';
	}
</script>