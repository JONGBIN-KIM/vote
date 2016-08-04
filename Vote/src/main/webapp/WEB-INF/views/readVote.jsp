<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang='ko'>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <link rel="stylesheet" type="text/css" href="../resources/bootstrap/css/bootstrap.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../resources/js/readVote.js" charset='utf-8'></script>
	<title>${voteVO.vTitle}</title>
</head>
<body>
	<div class='container'>
		<div class="row h5">
			<br><br><br>�� �� ��<br><br><br>
		</div>
		<div class="row h5">
			<div class="col-md-2"><strong>������ȣ</strong></div>
			<div class="col-md-10">${voteVO.vIdx}</div><br><br>
			<div class="col-md-2"><strong>�ۼ���</strong></div>
			<div class="col-md-10">${voteVO.vWriter}</div><br><br>
			<div class="col-md-2"><strong>��� ��¥</strong></div>
			<div class="col-md-10"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${voteVO.vUpdateDate}"></fmt:formatDate></div><br><br>
		</div>
		<a href="/listVote"><button type="button" class="btn btn-primary">���� �������</button></a>
		<hr size="50px">
		<h3>${voteVO.vTitle}</h3><br>
		<div class="alert alert-info" role="alert">������� Ŭ���� �̸����⸦ Ȱ��ȭ ��ų �� �ֽ��ϴ�.</div>
		<div class='col-md-12'>
			<c:forEach items ="${list}" var="voteQuestionVO">
				<dl>
					<!-- vIdx = ${voteQuestionVO.vIdx} -->
				<c:choose>
					<c:when test="${voteQuestionVO.cNo eq '0'}">
						<dt>${voteQuestionVO.qNo}. ${voteQuestionVO.content}</dt>
					</c:when>
					<c:otherwise>
						<dd><input type='radio' name='choice-${voteQuestionVO.vIdx}-${voteQuestionVO.qNo}-${voteQuestionVO.cNo}'>${voteQuestionVO.content}
						<c:if test="${voteQuestionVO.attach ne null }">
							<a tabindex="0" role="button" data-toggle="popover" data-trigger="focus" data-content=""><img src='${voteQuestionVO.attach}' class="img-thumbnail" width="50"></a>
						</c:if>
						</dd>
					</c:otherwise>																														 
				</c:choose>
				</dl>
			</c:forEach>
			<!-- bootstrap.css line 1447 '0 -> 20' -->
		</div>
		<div class='text-right'>
			<button type='button' class='btn btn-warning col-md-24' id='btn_reset'>�ʱ�ȭ</button>
			<button type='button' class='btn btn-primary col-md-24' id='btn_submit'>����</button><hr>
			<address>
				<strong>github.com/JONGBIN-KIM/vote</strong><br>
				Seoul, South Korea<br>
				<abbr title="Phone">P:</abbr> (123) 456-7890
			</address>
   		</div>
	</div>
</body>
</html>