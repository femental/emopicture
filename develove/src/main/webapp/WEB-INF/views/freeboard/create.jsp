<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
    
<%@include file="../include/header.jsp"%>
<br><br><br><br><br>
<style>
	form #cre,#cancle{
		
         margin-left:64%; 
      
	}

</style>

<div class="content-wrapper">
<section class="content-header"  style="margin-left:5%; width: 85%" >
      <ol class="breadcrumb">
         <li><a href="/"><i class="fa fa-dashboard"></i> Home</a></li>
         <li class="active">자유게시판 글쓰기</li>
      </ol>
   </section>

   <!-- Main content -->
	<section class="content"  style="margin-left:20%">
	<div class="box-body">
       <form id="createform">
				<div class="form-group" style="width:70%;">
					<label for="exampleInputEamil1">Title</label>
						<input type="text" name='title' class="form-control" >		
				</div>
				<div class="form-group" style="width:70%;">
					<label for="exampleInputPassword1">Content</label>
						<input type="text" name='content' class="form-control" style="height:200px">		
				</div>
				<div class="form-group" style="width:70%;">
					<label for="exampleInputEamil1">Writer</label>
						<input type="text" name='nickname' class="form-control" >		
				</div>
				<div class="form-group" style="width:70%;">
					<label for="exampleInputEamil1">MNO</label>
						<input type="text" name='mno' class="form-control" >		
				</div>
			</form>
	   <form  id="createform" >
		  <input type="hidden" name="bno" value="${freeboard.bno}">
		  <input id="cre" type="button" value="저장" style=" background-color: navy; color: white;">
		  <input id="cancel" type="button" value="취소" style="background-color: navy; color: white;">
	   </form>
			
   	</div>
   
   </section>
   <!-- /.content -->

<!-- /.content-wrapper -->

</div>


<%@include file="../include/footer.jsp"%>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>

<script>
    var target = $("#createform")[0];
    $("#cre").click(function(){
        target.action="/freeboard/create";
        target.method="post";
        target.submit();
    });
    $("#cancel").click(function(){
        target.action="/freeboard/list";
        target.submit();
    });
</script>
</body>
</html>