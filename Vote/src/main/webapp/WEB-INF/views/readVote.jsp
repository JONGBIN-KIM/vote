<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang='ko'>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="<c:url value="/resources/bootstrap/css/bootstrap.css"/>" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<c:url value='/resources/js/readVote.js'/>" charset='utf-8'></script>
	<title>${voteVO.vtitle}</title>
</head>
<body>
	<div class='container'>
		<div class="row h5">
			<div class="col-xs-3"><strong>설문번호</strong></div>
			<div class="col-xs-9">${voteVO.vidx}</div><br><br>
			<div class="col-xs-3"><strong>작성자</strong></div>
			<div class="col-xs-9">${voteVO.vwriter}</div><br><br>
			<div class="col-xs-3"><strong>등록 날짜</strong></div>
			<div class="col-xs-9"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${voteVO.vupdatedate}"></fmt:formatDate></div><br><br>
		</div>
		<a href="/listVote"><button type="button" class="btn btn-primary">설문 목록으로</button></a>
		<a href="/updateVote?vidx=${voteVO.vidx}"><button type="button" class="btn btn-info">설문 수정</button></a>
		<hr>
		<h3>${voteVO.vtitle}</h3><br>
		<div class="alert alert-info" role="alert">
			<span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span>
			썸네일을 누르고 있으면 <strong>미리보기가 활성화</strong>됩니다.
		</div>

		<c:if test="${voteVO.vstatus eq '2'}">
		<div class="alert alert-danger" role="alert">
			<span class="glyphicon glyphicon-alert" aria-hidden="true"></span>
			이 설문은 이미 <strong>조사기간이 만료</strong>된 설문입니다.            
		</div>
		</c:if>
      	<div class='col-md-12'>
		<c:forEach items ="${list}" var="voteQuestionVO">
		<dl>
			<!-- vidx = ${voteQuestionVO.vidx} -->
		<c:choose>
			<c:when test="${voteQuestionVO.cno eq '0'}">
			<dt class='question-title'>${voteQuestionVO.qno}. ${voteQuestionVO.content}</dt>
			</c:when>
			<c:otherwise>
				<dd><input type='radio' class='radio-${voteQuestionVO.qno}' name='choice-${voteQuestionVO.vidx}-${voteQuestionVO.qno}-${voteQuestionVO.cno}'>${voteQuestionVO.content}
				<c:if test="${voteQuestionVO.attach ne null }">
					<a tabindex="0" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" data-content=""><img src='${voteQuestionVO.attach}' class="img-thumbnail" width="50"></a>
				</c:if>
				</dd>
			</c:otherwise>                                                                                           
		</c:choose>
		</dl>
		</c:forEach>
		<!-- bootstrap.css line 1447 '0 -> 20' -->
		</div>
		<div class='text-right'>
			<button type='button' class='btn btn-warning col-md-24' id='btn_reset'>초기화</button>
			<button type='button' class='btn btn-primary col-md-24' id='btn_submit'>제출</button><hr>
			<address>
            <strong>github.com/JONGBIN-KIM/vote</strong><br>
            Seoul, South Korea<br>
            <abbr title="Phone">P:</abbr> (123) 456-7890
		</address>
		</div>
	</div>
	<form name="createForm" action="/createResult" method="post">
		<input type="hidden" name="result"/>
		<input type="hidden" name="vidx" value="${voteVO.vidx}"/>
	</form>
</body>
</html>