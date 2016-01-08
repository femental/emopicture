<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<br><br><br><br>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
   <!-- Content Header (Page header) -->
	<section class="content-header"  style="margin-left:10%">

		<hr align="left" style="border:solid 1px #CCCCCC; width:200px;">
		<ol class="breadcrumb">
			<li><a href="/"><i class="fa fa-dashboard"></i> Home</a></li>
			<li class="active">묻고 답하기</li>
			<li class="active">글 번호 : ${board.bno}</li>
			<li class="active">글 수정</li>
		</ol>
	</section>

   <!-- Main content -->
   <section class="content" style="margin-left:20%">
<div class="box-body">
      <form id="modifyForm" role="form"  method="post">
					    <input type='hidden' name='page' value="${cri.pageNo}"> 
						<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
						<input type='hidden' name='searchType' value="${cri.searchType}">
						<input type='hidden' name='keyword' value="${cri.keyword}">
    					<input type="hidden" name="bno" value="${board.bno}">
					
					<div class="form-group" style="width: 70%;">
						<label for="exampleInputEamil1">Title</label> <input type="text" name='title' class="form-control" value=${board.title}>
					</div>
					<div class="form-group" style="width: 70%;">
						<label for="exampleInputEamil1">Mno</label> <input type="text" name='mno' class="form-control" value=${board.mno}>
					</div>
					<div class="form-group" style="width: 70%;">
						<label for="exampleInputEamil1">Writer</label> <input type="text" name='nickname' class="form-control" value=${board.nickname}>
					</div>
					<div class="form-group" style="width: 70%;">
						<label for="exampleInputEamil1">E-mail</label> <input type="text" name='email' class="form-control" value=${board.email}>
					</div>
					<div class="form-group" style="width: 70%;">
						<label for="exampleInputPassword1">Content</label> <input 	type="text" name='content' class="form-control" style="height: 200px" value=${board.content}>
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">화면 어디든 드래그&드랍으로 파일을 업로드할 수 있습니다.</label>
						<div class="fileDrop"></div>
					</div>
					<div class="form-group">
						<ul class="mailbox-attachments clearfix uploadedList"></ul>
					</div>
						<!-- /.box-body -->
	
					<div class="box-footer">
						<div>
							<hr>
						</div>
						<button type="submit" class="btn btn-primary">수정</button>
						<button id="cancel" type="button" class="btn btn-primary">취소</button>
					</div>
		
	</form>
</div>
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
		var bno = ${board.bno};
		var template = Handlebars.compile($("#template").html());


$.getJSON("/qnaboard/getAttach/"+bno, function(list){
	$(list).each(function(){
		var fileInfo = getFileInfo(this);
		var html = template(fileInfo);
		console.log(fileInfo);
		$(".uploadedList").append(html);
	});
});

	

	
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
	

	$(".uploadedList").on("click", ".mailbox-attachment-info a", function(event){
		
		var fileLink = $(this).attr("href");
		
		if(checkImageType(fileLink)){
			
			event.preventDefault();
					
			var imgTag = $("#popup_img");
			imgTag.attr("src", fileLink);
			
			console.log(imgTag.attr("src"));
					
			$(".popup").show('slow');
			imgTag.addClass("show");		
		}	
	});

	$("#popup_img").on("click", function(){
		
		$(".popup").hide('slow');
		
	});	
	
	$(document).ready(function(){
		
		var formObj = $("form[role='form']");
		
		formObj.submit(function(event){
			event.preventDefault();
			
			var that = $(this);
			
			var str ="";
			$(".uploadedList .delbtn").each(function(index){
				 str += "<input type='hidden' name='files["+index+"]' value='"+$(this).attr("href") +"'> ";
			});
			
			that.append(str);
			
			that.get(0).submit();
		});
		
		
		$(".btn-warning").on("click", function(){
		  self.location = "/qnaboard/list?page=${cri.page}&perPageNum=${cri.perPageNum}"+
				  "&searchType=${cri.searchType}&keyword=${cri.keyword}";
		});
		
	});
</script>
   <!-- /.content -->
</div>
<!-- /.content-wrapper -->

<%@include file="../include/footer.jsp"%>

</body>
</html>