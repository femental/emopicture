<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<style>
.form-group{
	width:70%;
	margin-left:15%;
}
ul{
	list-style:none;
	padding-left:0px;
}

</style>
<br><br><br><br>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
   <!-- Content Header (Page header) -->
	<section class="content-header"  style="margin-left:10%">

		<hr align="left" style="border:solid 1px #CCCCCC; width:200px;">
		<ol class="breadcrumb">
			<li><a href="/"><i class="fa fa-dashboard"></i> Home</a></li>
			<li class="active"><a href="/refboard/list">자료실</a></li>
			<li class="active">글 번호 : ${board.bno}</li>
			<li class="active">글 수정</li>
		</ol>
	</section>

   <!-- Main content -->
   
    <section class="content" style="margin-left:20%">
    
      <form action="modify" role="form"  method="post">
      
		    <input type='hidden' name='pageNo' value="${cri.pageNo}"> 
			<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
			<input type='hidden' name='searchType' value="${cri.searchType}">
			<input type='hidden' name='keyword' value="${cri.keyword}">
 					
		<div class="box-body">
		
					<div class="form-group" style="width: 70%;">
 						<input type="hidden" name="bno" class="form-control" value="${board.bno}">
					</div>
					
					<div class="form-group" style="width: 70%;">
						<label for="exampleInputEamil1">Title</label>
						 <input type="text" name='title' class="form-control" value="${board.title}">
					</div>
					
					<div class="form-group" style="width: 70%;">
						<label for="exampleInputEamil1">Writer</label> 
						<input type="text" name='nickname' class="form-control" value="${board.nickname}">
					</div>
					
					<div class="form-group" style="width: 70%;">
						<label for="exampleInputPassword1">Content</label>
						 <textarea class="form-control" name="content" rows="3">${board.content}</textarea>
						 <!-- <input type="text" name='content' class="form-control" style="height: 200px" value=${boardVO.content}> -->
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
	
					<div class="box-footer">
						<div>
							<hr style="width:70%;margin-left:15%;">
						</div>
						<button type="submit" class="btn btn-primary">수정</button>
						<button type="submit" class="btn btn-warning">취소</button>
					</div>
		
	</form>
</section>
	
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
	
	$(".btn-primary").on("click", function() {
		formObj.submit();
	});
	
	
	$(".btn-warning").on("click", function(){
	  self.location = "/refboard/list?pageNo=${cri.pageNo}&perPageNum=${cri.perPageNum}"+
			  "&searchType=${cri.searchType}&keyword=${cri.keyword}";
	});
});


		var bno = ${board.bno};
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
		

$.getJSON("/refboard/getAttach/"+bno, function(list){
	$(list).each(function(){
		var fileInfo = getFileInfo(this);
		var html = template(fileInfo);
		console.log(fileInfo);
		$(".uploadedList").append(html);
	});
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
	
	
	
</script>
	

   <!-- /.content -->

<!-- /.content-wrapper -->


</body>
</html>
