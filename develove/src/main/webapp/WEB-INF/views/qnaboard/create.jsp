<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>

<br><br><br><br>
<style>
.form-group{
	width:70%;
	margin-left:15%;

}

</style>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header" style="width:70%;margin-left:15%;">
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
			<li class="active">글쓰기</li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content" style="width:70%;margin-left:15%;">
		<div class="box-body">
					<div class="form-group">
					<form id="registerForm" role="form" method="post">
					<input type="hidden" name="bno" value="${board.bno}">
					</div>
					<div class="form-group">
						<label for="exampleInputEamil1">Title</label> <input type="text" name='title' class="form-control" placeholder="Title">
					</div>
					<div class="form-group">
						<label for="exampleInputEamil1">Mno</label> <input type="text" name='mno' class="form-control" placeHolder="MNO">
					</div>
					<div class="form-group">
						<label for="exampleInputEamil1">Writer</label> <input type="text" name='nickname' class="form-control" placeholder="Writer">
					</div>
					<div class="form-group">
						<label for="exampleInputEamil1">E-mail</label> <input type="text" name='email' class="form-control" placeholder="E-mail">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">Content</label> <input 	type="text" name='content' class="form-control" style="height: 200px" placeholder="Content">
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">화면 어디든 드래그&드랍으로 파일을 업로드할 수 있습니다.</label>
						<div class="fileDrop"></div>
					</div>
					<div class="form-group">
						<ul class="mailbox-attachments clearfix uploadedList"></ul>
					</div>
				</div>
	<!-- /.box-body -->
	
					<div class="box-footer" align="center">
						<div>
							<hr style="width:70%;margin-left:15%;">
						</div>
						<button type="submit" class="btn btn-primary">등록</button>
				    	<button id="cancel" type="button" class="btn btn-primary">취소</button>						
					</div><br><br>
		
</form>
	</section>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->

<%@include file="../include/footer.jsp"%>

   <!-- HANDLEBARS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script id="template" type="text/x-handlebars-template">
<li>
  <span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
  <div class="mailbox-attachment-info">
	<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
	<a href="{{fullName}}" 
     class="btn btn-default btn-xs pull-right delbtn"><i class="fa fa-fw fa-remove"></i></a>
	</span>
  </div>
</li>                
</script> 
<script>

	

	
	var template = Handlebars.compile($("#template").html());
	
	$(".body").on('dragenter dragover', function(event){
		event.preventDefault();
	});
	
	$(".body").on("drop", function(event){
		event.preventDefault();
		var files = event.originalEvent.dataTransfer.files;
		var file = files[0];
		var formData = new FormData();
		formData.append("file", file);
		
		$.ajax({
			url: "/uploadAjax",
			data: formData,
			dataType: 'text',
			processData: false,
			contentType: false,
			type: 'post',
			success: function(data){
				var fileInfo = getFileInfo(data);
				var html = template(fileInfo);
				$(".uploadedList").append(html);
			}
		})
	});
	
	
	$("#registerForm").submit(function(event){
		event.preventDefault();
		
		var that = $(this);
		console.log(that);
		
		var str ="";
		$(".uploadedList .delbtn").each(function(index){
			 str += "<input type='hidden' name='files["+index+"]' value='"+$(this).attr("href") +"'> ";
		});
		
		console.log("STR: " + str);
		that.append(str);
		
		that.get(0).submit();
	});
	


	$(".uploadedList").on("click", ".delbtn", function(event){
		
		event.preventDefault();
		
		var that = $(this);
		console.log(that);
		$.ajax({
		   url:"/deleteFile",
		   type:"post",
		   data: {fileName:$(this).attr("href")},
		   dataType:"text",
		   success:function(result){
			   if(result == 'deleted'){
				   that.closest("li").remove();
			   }
		   }
	   });
	});
	

</script>
</body>
</html>