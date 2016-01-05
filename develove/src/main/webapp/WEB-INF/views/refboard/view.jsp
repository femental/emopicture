<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<br><br><br><br>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
	<div class="content-header" style="width:70%;margin-left:15%;">

        <ol class="breadcrumb" style="margin-bottom:0px; background-color:#F2DEDE;">
           <li><a href="/"><i class="fa fa-dashboard"></i> Home</a></li>
           <li class="active"><a href="/refboard/list">자료실</a></li>
           <li class="active">글 번호:${board.bno}</li>
        </ol>
	</div>
	
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
<!--     <style type="text/css">
    	.popup{
    		position:absolute;
    	}
    	.back {
    		background-color: gray; 
    		opacity:0.5;
    		width:100%;
    		height:300%;
    		overflow:hidden;
    		z-index:1101;
    	}
    	.front{
    		position:relative;
    		max-width: 1200px;
    		max-height:800px;
    		overflow: auto;
    	} 
    </style>-->
    <!-- Main content -->
    <div class="content" style="width:70%;margin-left:15%;border:solid 1px #CCCCCC;">
    	
    	<div>
    		<div style="margin-top:10px;margin-left:5%;">
    			<h4 style="">${board.title}</h4>
    		</div>
    		<div style="margin-top:-40px;">
    			<h6 align="right" style="margin-right:5%">${board.regdate}</h6>
    		</div>
    		<hr align="center" style="border:dashed 1px #CCCCCC; width:90%;margin-top:-25px;"> 
    	</div>
    	<div style="margin-top:-15px">
    		<div style="margin-top:10px;margin-left:5%;">
    			<h5 style="">작성자:&nbsp;${board.nickname}</h5>
    		</div>
    		<div style="margin-top:-45px;">
    			<h6 align="right" style="margin-right:5%">댓글수:${board.replycnt}&nbsp;|&nbsp;조회수:${board.viewcnt}</h6>
    		</div>
    	</div>
        <div>
    		<div style="height:400px">
    			<h5 style="margin-left:5%;">${board.content}</h5>
    		</div>    		
    	</div>
    	
      		<hr align="center" style="border:solid 1px #CCCCCC; width:90%;margin-top:-25px;"> 
      		
  <!-- 댓글부분 -->
		<div style="margin-top:-10px;margin-left: 4%; width:80%;">
			<input  id="replyToggle" type="button" value="댓글보기 [${board.replycnt}]" style="margin-left:10px">
        </div>
  		<div>
  			<div class="row" id="replyTable">
         		<div class="col-sm-4 col-lg-4 col-md-4" style="width: 90%;margin-left:5%;">
            		<div >
              			 <ul id="replyLi" style="width: 90%;margin-right:5%;">
                  			<li id="replies" style="width: 90%;margin-right:5%;"></li>
               			 </ul>
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
<!-- /.content -->

<!-- THUMBNAIL MODAL -->
<div class='popup back' style="display:none;"></div>
	<div id="popup_front" class='popup front' style="display:none;"><img id="popup_img">
	</div>
<!-- cridata -->
<form id="cri">
    <input type="hidden" name="pageNo" value="${cri.pageNo}" >
    <input type="hidden" name="searchType" value="${cri.searchType}">
    <input type="hidden" name="keyword" value="${cri.keyword}">
    <input type="hidden" name="totalCount"  value="${cri.totalCount}">
    <input type="hidden" name="perPage"  value="${cri.perPage}">
    <input type="hidden" name="perPageNum"  value="${cri.perPageNum}">
    <input type="hidden" name="bno" >
</form>

  <ul class='pagination'></ul>

<div id="modDiv" class="modal " style="display: none;">
   <div class="modal-title"></div>
   <div>
      <textarea rows="0" cols="0" type="text" id="replytext" onpaste="return" style="width: 100%;height:50px;"></textarea>
   </div>
   <div>
      <button type="button" id="replyModBtn">수정</button>
      <button type="button" id="replyDelBtn">삭제</button>
      <button type="button" id="closeBtn" >닫기</button>
   </div>
</div>




   <!-- HANDLEBARS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script id="templateAttach" type="text/x-handlebars-template">
<li data-src='{{fullName}}'>
  <span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
  <div class="mailbox-attachment-info">
	<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
	</span>
  </div>
</li>                
</script>  

<script>
			
			var bno = ${board.bno};
			var template = Handlebars.compile($("#templateAttach").html());
			getAllList();
			
			
			$.getJSON("/refboard/getAttach/"+bno, function(list){
				$(list).each(function(){
					var fileInfo = getFileInfo(this);
					var html = template(fileInfo);
					console.log(fileInfo);
					$(".uploadedList").append(html);
				});
			});
			 
 			$(".uploadedList").on("click", "mailbox-attachment-info a", function(event){
				var fileLink = $(this).attr("href");
				if(checkImageType(fileLink)){
					event.preventDefault();
					var imgTag = $("#popup_img");
					imgTag.attr("src", fileLink);
					
					console.log(imgTag.attr("src"));
					
					$(".popup").show("slow");
					imgTag.addClass("show");
				}
			});
			
			$("#popup_img").on("click", function(){
				$(".popup").hide("slow");
			});
			 
			

			
			function addReply(){
				   $("#replyAddBtn").on("click", function(){
				      var replyer = $("#newReplyWriter").val();
				      var replytext = $("#newReplyText").val(); 
				      $.ajax({
				         type : 'post',
				         url : '/refreplies/',
				         headers : {
				            'content-Type' : 'application/json',
				            'X-HTTP-Method-Override' : 'POST'
				         },
				         dataType : 'text',
				         data : JSON.stringify({
				            bno : bno,
				            replyer : replyer,
				            replytext : replytext
				         }),
				         success : function(result){
				            if(result == 'Success'){
				               alert("등록되었습니다.")
				               event.preventDefault();
				               getAllList();
				            }
				         }
				      });
				   });
				}
				addReply();

			  
			function getAllList(){   
			   var str = "";
			   $.getJSON("/refreplies/" + bno, function(data){
			      $(data).each(
			            function(){
			               str += "<li data-rno='"+this.rno+"' data-text='"+this.replytext+"' class='replyLi'>"
			                  +"<img src='img/reply.png'>&nbsp;&nbsp;"+this.replyer+"<dl><span><img src='img/arrow-right.png'>&nbsp;&nbsp;"+this.replytext
			                  +"</span></dl><dt><span><button>수정</button></sapn></dt></li>";
			            });
			      $("#replies").html(str);
			   });
			}

			   $("#replies").on("click", ".replyLi dt span button", function(){
			      var reply = $(this).parent().parent().parent();
			      var rno = reply.attr("data-rno");
			      var replytext = reply.attr("data-text");
			      
			      $("#modDiv").show("slow");		      
			      $(".modal-title").html(rno);
			      $("#replytext").val(replytext);
			   });
			   
				$("#modDiv").on('click', 'div #closeBtn', function(){
					$("#modDiv").hide("slow");
				});
			   
			   
			  $("#replyModBtn").on("click",function(){
			  var rno = $(".modal-title").html(); 
			  console.log(rno);
			  var replytext = $("#replytext").val();
			
			  $.ajax({
			     type : "put",
			     url : "/refreplies/"+rno,
			     headers : {
			        'content-Type' : 'application/json',
			        'X-HTTP-Method-Override' : 'PUT'
			     },
			     data : JSON.stringify({replytext : replytext}),
			     dataType : "text",
			     success : function(result){
			        console.log("result: "+result);
			        if(result == 'Success'){
			           alert("수정 되었습니다.");
			           $("#modDiv").hide("slow");
			           getAllList();
			        }
			     }
			  });
			});
			
			
	
			$("#replyDelBtn").on("click", function(){
			  var rno =$(".modal-title").html();
			  var replytext =$("#replytext").val();
			  console.log(rno);
			  $.ajax({
				     type : "DELETE",
				     url : "/refreplies/"+rno,
				     headers : {
				        'content-Type' : 'application/json',
				        'X-HTTP-Method-Override' : 'DELETE'
				     },
				     data : JSON.stringify({replytext : replytext}),
				     dataType : "text",
				     success : function(result){
				        console.log("result: "+result);
				        if(result == 'Success'){
				           alert("삭제되었습니다.");
				           $("#modDiv").hide("slow");
				           getAllList();
			            }
			         }
			      });
			   });
			   

		
			
			   
			    var target = $("#viewform")[0];
			    $("#list").on("click", function(){
			        var criform = $("#cri");
			    	criform.attr("action","/refboard/list").submit();
			    });
			    $("#mod").on("click", function(){
			        target.action="/refboard/modify";
			        target.submit();
			    });
			    $("#del").on("click", function(){
			        target.action="/refboard/delete";
			        target.method="post";
			        target.submit();
			    }); 
			
			    
			    
				
			    
</script>
<%@include file="../include/footer.jsp"%>
</body>
</html>