<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8" >
<title>메인</title>
<style>




#wrap{
/* border : 1px solid #b3b3b3; */
/* text-align: center; */
}

#here{
/*   border : 1px solid #b3b3b3; */
/*    width: 1300px;  */
  height: 100%;
  margin: 0 auto;
  display: inline-block;
  padding : 50px 130px 50px 130px;
}

#card {
  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.1);
  border : 1px solid #b3b3b3;
  width: 350px;
  height: 350px;
  display: inline-block;
  transition: 0.3s;
  padding:0;
  margin:10px;
}

#card img{
width: 100%;
height: 200px;
padding :0;
margin: 0;
}

#card:hover {
  box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
}


#textContainer {
  padding: 10px;
  width: 320px;
  
  text-overflow:ellipsis;
  white-space:nowrap;
  overflow:hidden;
  word-break:break-all;

    margin: 0;
}

	
#studioimage{
  width: 350px;
  height: 180px;
  object-fit: cover;
      padding: 0;
    margin: 0;
}

p{
line-height : 10px;
}

#searchTextA{
font-size: 32px;
text-align: left;
}

#searchTextB{
font-size: 25px;
}

#topSearch{
border : 1px solid #b3b3b3;
height : 110px;
text-align: center;
padding :50px;
margin: 20px;
}

#topSearchIn{
/* border : 1px solid #b3b3b3; */
margin: 0 auto;
display: inline-block;
}


	




</style>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>

$(function(){
	$("#btn1").on("click", function() {
		
		var chkArr = [];
		  $("input[name=chk]:checked").each(function() { 
		       var chk = $(this).val();
		       chkArr.push(chk);
		       console.log(chkArr);
		    });
		
		$.ajax({
			url:"searchByOption",
			data:{"loc":$("#loc").val(),"subway":$("#subway").val(), "chkArr":chkArr},
			type:"get",
			success:function(responseData){
				$("#here").html(responseData);
			}
		});
	});
});

 $(function(){
	$("#btn2").on("click", function() {
		location.href='searchAll';
		
		
	});

}); 

</script>

</head>
<body>
<jsp:include page="../common/header.jsp"></jsp:include>

	<div id="topSearch">
		<div id="topSearchIn">
			<span id="searchTextA">
			지하철 : <input type="text" placeholder="지하철을 입력하세요" name="subway" id="subway">
			지역 : <input type="text" placeholder="지역을 입력하세요" name="loc" id="loc">
			</span>
			<br>
			
			<span id="searchTextB">
			<input type="checkbox" name="chk" value="1">마이크
			<input type="checkbox" name="chk" value="2">주차장
			<input type="checkbox" name="chk" value="3">샤워장
			<input type="checkbox" name="chk" value="4">정수기
			<input type="checkbox" name="chk" value="5">에어컨
			<input type="checkbox" name="chk" value="6">난방기
			<input type="checkbox" name="chk" value="7">내부화장실
			<input type="button" value="검색" id="btn1">
			<input type="button" name="chk" value="초기화" id="btn2">
			</span>
		</div>
	</div>
	
	<div id="wrap">
		<div id ="here">

		 	<c:forEach var="listall" items="${searchAll}">
				<div id="card" onclick="location.href='${pageContext.request.contextPath}/main/roomDetail?studioid=${listall.studio_no}';">
			
				  <c:set var="pPath" value="${pageContext.request.contextPath}" />
				  <img src="${pPath}/imageUpload/${listall.studio_picture}">
			
				  <div id="textContainer">
				    <span id="searchTextA">${listall.studio_name}</span>
				    <p>${listall.studio_subway}</p> 
				    <p>${listall.studio_desc}</p> 
				    
				  </div>
				</div>
			</c:forEach>
		</div>
	</div>

	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>

<%-- ${listall.studio_picture} --%>