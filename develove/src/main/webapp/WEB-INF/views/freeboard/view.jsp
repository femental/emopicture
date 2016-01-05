<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
    
<%@include file="../include/header.jsp"%>
<br><br><br><br>

<style>
        #replyLi li{
            margin-top: 10px;
            border-bottom: 1px solid #cccccc;
            width : 900px;

        }
        dt{
            margin-bottom: 5px;
            margin-left: 840px;
            margin-top: -50px;
        }


        dl{
            margin-top: 10px;
            margin-left: 20px;
        }

        ul{
            list-style: none;
        }

        #modDiv{
            width : 500px;
            height : 140px;
            background-color: #BDBDBD;
            position : absolute;
            top : 70%;
            left : 50%;
            margin-top: -50px;
            margin-left: -150px;
            padding : 10px;
            z-index:500;
        } 
</style>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<div class="content-header" style="width:70%;margin-left:15%;" >

		<ol class="breadcrumb">
			<li><a href="/"><i class="fa fa-dashboard"></i> Home</a></li>
            <li class="active"><a href="/freeboard/list">자유게시판</a></li>
			<li class="active">글 번호 : ${freeboard.bno}</li>
		</ol>
	</div>
	
	
	<!-- Main content -->
    <div class="content" style="width:70%;margin-left:15%;border:solid 1px #CCCCCC;">
    	
    	<div>
    		<div style="margin-top:10px;margin-left:5%;">
    			<h4 style="">${freeboard.title}</h4>
    		</div>
    		<div style="margin-top:-40px;">
    			<h6 align="right" style="margin-right:5%">${freeboard.regdate}</h6>
    		</div>
    		<hr align="center" style="border:dashed 1px #CCCCCC; width:90%;margin-top:-25px;"> 
    	</div>
    	<div style="margin-top:-15px">
    		<div style="margin-top:10px;margin-left:5%;">
    			<h5 style="">작성자:&nbsp;${freeboard.nickname}</h5>
    		</div>
    		<div style="margin-top:-45px;">
    			<h6 align="right" style="margin-right:5%">댓글수:${freeboard.replycnt}&nbsp;|&nbsp;조회수:${freeboard.viewcnt}</h6>
    		</div>
    	</div>
        <div>
    		<div style="height:400px">
    			<h5 style="margin-left:5%;">${freeboard.content}</h5>
    		</div>    		
    	</div>
    	
      		<hr align="center" style="border:solid 1px #CCCCCC; width:90%;margin-top:-25px;"> 
 
 	<!-- 댓글부분 -->
 		<div style="margin-top:-10px;margin-left: 4%; width:80%;">
			<input  id="replyToggle" type="button" value="댓글보기 [${freeboard.replycnt}]" style="margin-left:10px">
        </div>
  		<div>
  			<div class="row" id="replyTable">
         		<div class="col-sm-4 col-lg-4 col-md-4" style="width: 90%;margin-left:5%;">
            		<div >
              			 <ul id="replyLi" style="width: 90%;margin-right:5%;">
                  			<li id="replies" style="width: 90%;margin-right:5%;"></li>
               			 </ul>
               			 <ul class="pagination" ></ul>	               			 
            		</div>   
         		</div>
      		</div>
  		</div>
  		
		<div>	
			<div>
				<div style="margin-top:10px;margin-left:15%;">
					<input  type="text" name="replyer" id="newReplyWriter" style="width:200px" placeholder="작성자">
				</div>
	    		<div style="margin-top:10px;margin-left:15%;">
            		<textarea rows="0" cols="0" onpaste="return" type="text" name="replyer" id="newReplyText" style="width: 71%;height:70px;" placeholder="댓글을 작성하세요"></textarea>
	    		</div>
	    		<div  align="right" style="margin-top:-75px;margin-right:15%;">
                	<button id="replyAddBtn"  style="width:10%;height:70px;">확인</button>
	    		</div>
	    	</div>
		<br>
        </div>  		
    </div>
 </div>
		
			
<!-- 글쓰기/수정/삭제/목록 버튼 -->
<div align="right" style="width:70%;margin-left:15%;margin-top:10px; background-color:#fff;">
	<form id="viewform" >
    	<input type="hidden" name="bno" value="${freeboard.bno}">
        <a href="/freeboard/create"><input type="button" value="글쓰기"></a>
        <input id="mod" type="button" value="수정">
        <input id="del" type="button" value="삭제">
        <input id="list" type="button" value="목록">
	</form>
</div>			
<br>	
			
<form id="viewform">
	<input type="hidden" name="bno" value="${freeboard.bno}"> 
	<input type="hidden" name="pageNo" value="${cri.pageNo}"> 
	<input type="hidden" name="perPageNum" value="${cri.perPageNum}">
	<input type="hidden" name="searchType" value="${cri.searchType}">
	<input type="hidden" name="keyword" value="${cri.keyword}"> 
</form>

	
		
<div id='modDiv' style="display: none;">
	<div class='modal-title'></div>
	<div style="margin-left: 3%">
		<input type='text' id='replytext'  size="50" style="font-size: 20pt; height: 150px">
	</div>
	<br>
	<div class="pull-right" style="margin-right: 6%">
		<button type="button" id="replyModBtn">수정</button>
		<button type="button" id="replyDelBtn">삭제</button>
		<button type="button" id="closeBtn">닫기</button>
	</div>
</div>

		
</div>



<%@include file="../include/footer.jsp"%> 
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>

<script>
	
		var bno = ${freeboard.bno};
		var replyPage=1;
		
		getPageList(1);
		
		
			
		
		function getAllList(){
		$.getJSON("/replies/all/"+bno,function(data){
			var str="";
			console.log(data.length);
			
			$(data).each(function(){
				str += "<li data-rno='"+this.rno+"' data-text='"+this.replytext+"' class='replyLi'>"+"<img src='/resources/img/replytext.jpg'>&nbsp;&nbsp;"+this.replyer  +"<p>"+"&nbsp;&nbsp;<img src='/resources/img/replyer.png'>&nbsp;&nbsp;"+this.replytext+
				"&nbsp;&nbsp;<button class='pull-right'>수정</button></div>";
			console.log(str);
			});
			$("#replies").html(str); 
		}); 
		
		
		
		}
		$("#replies").on("click",".replyLi button",function(){
			
			var reply=$(this).parent().parent();
			console.log(reply);
			
			var rno=reply.attr("data-rno");
			
			console.log("data - rno : " + rno);
			
			var replytext=reply.attr("data-text");
			console.log(reply.text);
			$(".modal-title").html(rno);
			
			$("#replytext").val(replytext);
			$("#modDiv").show("slow");
			
			
		});	

		
		$("#replyAddBtn").on("click",function(){
			
			var replyer= $("#newReplyWriter").val();
			var replytext=$("#newReplyText").val();
			
			$.ajax({
				type:'post',
				url :'/replies/',
				headers:{
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"},
				dataType : 'text',
				data : JSON.stringify({bno:bno,replyer:replyer,replytext:replytext}),
				success : function(result){
					
					if(result=='SUCCESS'){
						alert("SUCCESS");
						getPageList(replyPage);
					/* 	getPageList(page); */
					}
				}
				
			});
		});

	$("#replyDelBtn").on("click",function(){
		var rno=$(".modal-title").html();
		var replytext=$("#replytext").val();
		
		console.log("rno: "+rno);
		$.ajax({  
			type:'delete',
			url: '/replies/'+rno,
			headers :{
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "DELETE"},	
			data:JSON.stringify({replytext:replytext}),	
			dataType:'text',
			success : function(result){
				console.log("result:"+result);
				if(result=='SUCCESS'){
					alert("삭제되었습니다.");
					$("#modDiv").hide("slow");
					getPageList(replyPage);
				}
			}
		}); 
	
	}); /* 삭제 */
	
	

	$("#replyModBtn").on("click",function(){

			var rno=$(".modal-title").html();
			var replytext=$("#replytext").val();
	
	$.ajax({
		type:'put',
		url: '/replies/'+rno,
		headers :{
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "PUT"},
		data:JSON.stringify({replytext:replytext}),
		dataType:'text',
		success : function(result){
			console.log("result:"+result);
			if(result=='SUCCESS'){
				alert("수정 되었습니다.");
				$("#modDiv").hide("slow");
				
				getPageList(replyPage);
			}
		}
	});
	
	}); /* 수정*/
	
	$("#modDiv").on('click', 'div #closeBtn', function(){
		$("#modDiv").hide("slow");
	});
	
	
	//$("#closeBtn").on("click",function(){

	//	$("#modDiv").hide("slow");
	//	getAllList();
		//getPageList(replyPage)
	
	//}); /* 닫기*/ 
	
	function getPageList(page){
		$.getJSON("/replies/"+bno+"/"+page,function(data){
		console.log(bno);
		console.log(page);
		console.log(data.list.length);
		var str="";
	
		$(data.list).each(function(){
			str += "<li data-rno='"+this.rno+"' data-text='"+this.replytext+"' class='replyLi'>"+"<img src='/resources/img/replytext.jpg'>&nbsp;&nbsp;"+this.replyer+"&nbsp;&nbsp;&nbsp;"+"("+this.regdate+")" +"<p>"+"&nbsp;&nbsp;<img src='/resources/img/replyer.png'>&nbsp;&nbsp;"+this.replytext+
			"&nbsp;&nbsp;<button class='pull-right'>수정</button></div>";
	
		});
		$("#replies").html(str);
	
		printPaging(data.pageMaker);
		});
		} /* getPageList */

		function printPaging(pageMaker){

				var str="";
	
			if(pageMaker.prev){
				str += "<li><a href='"+(pageMaker.startPage-1)+"'> << </a></li>";
			}
	
			for(var i=pageMaker.startPage, len=pageMaker.endPage; i<=len;  i++){
				var strClass=pageMaker.cri.page==i?'class=active':'';
				str += "<li "+strClass+"><a href='"+i+"'>"+i+"</a></li>";
			}
		
			if(pageMaker.next){
				str += "<li><a href='"+(pageMaker.endPage+1)+"'> >> </a></li>";
			}
			$('.pagination').html(str);
		}/* pageMaker */

	$(".pagination").on("click", "li a", function(event) {
		
		event.preventDefault();
		
		replyPage = $(this).attr("href");
		
		getPageList(replyPage);
		
	});

	var target = $("#viewform")[0];
	$("#list").click(function() {
		target.action = "/freeboard/list";
		target.submit();
	});
	$("#mod").click(function() {
		target.action = "/freeboard/modify";
		target.submit();
	});
	$("#del").click(function() {
		target.action = "/freeboard/delete";
		target.method = "post";
		target.submit();
	});
	
	
</script>
</body>
</html>