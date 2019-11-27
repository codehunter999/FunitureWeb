<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<<<<<<< HEAD
<title>Home</title>
=======
<title>diningroom upload</title>
>>>>>>> 4a3a37b31618fcba9971be6e4fb162ea5a2f5c7d
<script type="text/javascript">
function sendIt(){
	
	var f = document.myForm;
	
	f.action = "<%=cp %>/diningupload_ok.fu";
	f.submit();
}

</script>
</head>
<body>

<<<<<<< HEAD
=======
<h2>다이닝룸 업로드</h2>

>>>>>>> 4a3a37b31618fcba9971be6e4fb162ea5a2f5c7d
<br/><br/><br/>

<form name="myForm" method="post" enctype="multipart/form-data">

	이미지인덱스
	<input name="imageIndex" type="text"><br/>
	
	상품명
	<input name="productName" type="text"><br/>
	
	카테고리
	<input name="cate" type="text"><br/>
	
	jsp상세주소카테고리(카테고리영어)
	<input name="cateEn" type="text"><br/>
	
	가격
	<input name="price" type="text"><br/>
	
	이미지
	<input name="diningImageUpload" type="file"><br/>
	
	<input type="submit" onclick="sendIt();" value="글올리기" >

</form>

</body>
</html>
