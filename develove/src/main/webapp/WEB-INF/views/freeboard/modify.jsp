<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
    
<%@include file="../include/header.jsp"%>
<br><br><br><br><br>

<div class="content-wrapper">
   <!-- Content Header (Page header) -->
<section class="content-header"  style="width:70%;margin-left:15%;">

		<ol class="breadcrumb">
			<li><a href="/"><i class="fa fa-dashboard"></i> Home</a></li>
			<li class="active">자유게시판</li>
			<li class="active">글 번호 : ${freeboard.bno}</li>
			<li class="active">글 수정</li>
		</ol>
	</section>
   
  <section class="content" style="margin-left:20%">

      <form action="/freeboard/modify" method="post">
      <input type="hidden" name="bno" value="${freeboard.bno}">
		<div class="box-body">
			<div class="form-group" style="width:70%;">
				<label for="exampleInputEamil1">Title</label>
					<input type="text" name='title' class="form-control" value="${freeboard.title}">		
			</div>
			<div class="form-group" style="width:70%;">
				<label for="exampleInputPassword1">Content</label>
					<textarea class="form-control" name='content' rows="7">${freeboard.content}</textarea>		
			</div>
			<div class="form-group" style="width:70%;">
				<label for="exampleInputEamil1">Writer</label>
					<input type="text" name='nickname' class="form-control" value="${freeboard.nickname}">		
			</div>
			<div class="form-group" style="width:70%;">
				<label for="exampleInputEamil1">MNO</label>
					<input type="text" name='mno' class="form-control" value="${freeboard.mno}">		
			</div>
		</div>
 			<div style="width:70%;" class="pull-right">
				<form>
				    <button class="btn btn-primary" style="border-color: black;" >저장</button>
				    <button class="btn btn-warning" style="border-color: orange;" >취소</button>
				</form>
			</div>
      
   <script>
         $(document).ready(function(){
            
            var formObj= $("form[role='form']");
            
            $(".btn-warning").on("click",function(){
               self.location="/freeboard/view";
            });
            
            $(".btn-primary").on("click",function(){
               formObj.submit();
            });
            
         });
      
   
   </script>
   </form>
   
   </section>
   <!-- /.content -->
</div>
<!-- /.content-wrapper -->




<%@include file="../include/footer.jsp"%>
</body>
</html>