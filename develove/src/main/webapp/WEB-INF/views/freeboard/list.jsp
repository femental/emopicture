<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
    
<%@include file="../include/header.jsp"%>
<br><br><br><br><br>
<style>
	.table th{
		text-align:center;
	}
	.table td{
		text-align:center;
	}

	 div.pagination {
        display: table;
        margin-left: auto;
        margin-right: auto;
      }

</style>
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header" style="width:70%;margin-left:15%;">
 
        <ol class="breadcrumb" style="margin-bottom:0px; background-color:#F2DEDE;">
           <li><a href="/"><i class="fa fa-dashboard"></i> Home</a></li>
           <li class="active">자유게시판</li>
        </ol>
	</section>

	<!-- Main content -->	
	<section class="content">
		<div style="width:70%;margin-left:15%;">
			<table class="table table-bordered" >
				<tr>
					<th style="width: 5%">글번호</th>
					<th style="width: 30% ">제 목</th>
					<th style="width: 15%">작성자</th>
					<th style="width: 15%">등록일</th>
					<th style="width: 5%">조회수</th>
				</tr>
			
				<c:forEach var="freeboardVO" items="${list}">
				
					
					<tr>
						<td>${freeboardVO.bno}</td>
						<td><a href="/freeboard/view${pageMaker.makeSearch(pageMaker.cri.pageNo)}&bno=${freeboardVO.bno}">${freeboardVO.title}<strong>[${freeboardVO.replycnt}]</strong></a></td>
						<td>${freeboardVO.nickname}</td>
						<td>${freeboardVO.regdate}</td>
						<td>${freeboardVO.viewcnt}</td>
					</tr>
				
				</c:forEach>
			
			</table>
		</div>
	</section>
		
		
		<hr align="left" style="border: solid 1px #CCCCCC; width:70%;margin-left:15%;margin-top:-20px;">
		<div align="right" style="width:70%;margin-left:15%;margin-top:-15px;">
			<button>
					<a href="/freeboard/create">글쓰기</a>
			</button>
		</div>

		
	<div class="row text-center">		
		<div class="col-lg-12" style="width:70%;margin-left:15%;margin-top:-10px;">
			<ul class="pagination" >
				<c:if test="${pageMaker.prev}">
					<li><a href="/freeboard/list${pageMaker.makeSearch(pageMaker.startPage-1) }">&laquo;</a></li>
				</c:if>
					
				<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
					<li <c:out value="${pageMaker.cri.pageNo==idx?'class=active':''}"/>>
						<a href="/freeboard/list${pageMaker.makeSearch(idx) }">${idx}</a>
					</li>
				</c:forEach>
				
			
				<c:if test="${pageMaker.next && pageMaker.endPage>0}">
					<li><a href="/freeboard/list${pageMaker.makeSearch(pageMaker.endPage+1) }" >&raquo;</a></li>
				</c:if>
			 </ul>
		</div>
		<div class="col-lg-12" style="width:70%;margin-left:15%;margin-top:-10px;margin-bottom:20px;">
			<select name="searchType"  style="height:30px">
				<option value="n" 
				<c:out value="${cri.searchType == null?'selected':''}"/>>----</option> 
				<option value="t" 
				<c:out value="${cri.searchType eq 't'?'selected':''}"/>>제목</option> 
				<option value="c" 
				<c:out value="${cri.searchType eq 'c'?'selected':''}"/>>내용</option> 
				<option value="w" 
				<c:out value="${cri.searchType eq 'w'?'selected':''}"/>>작성자</option> 
				<option value="tc" 
				<c:out value="${cri.searchType eq 'tc'?'selected':''}"/>>제목+내용</option> 
				<option value="cw" 
				<c:out value="${cri.searchType eq 'cw'?'selected':''}"/>>내용+작성자</option> 
				<option value="tcw" 
				<c:out value="${cri.searchType eq 'tcw'?'selected':''}"/>>전체</option> 
				
			</select>
			<input type="text" name="keyword" id="keywordInput" value="${cri.keyword}" style="width:20%;height:30px;" >
			<button id="searchBtn" size="50px" style="height:30px">검색</button>
			
			</div>
			</div>
</div>
	




<%@include file="../include/footer.jsp"%>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>

<script>
$(document).ready(function(){
	
	$('#searchBtn').on(
		"click",
		function(event){
			self.location="/freeboard/list"
			+'${pageMaker.makeQuery(1)}'
			+"&searchType="
			+$("select option:selected").val()
			+"&keyword=" + $('#keywordInput').val();
			
		});

});

</script>
</body>
</html>