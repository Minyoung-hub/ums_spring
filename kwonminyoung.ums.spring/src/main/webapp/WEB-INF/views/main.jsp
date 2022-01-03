<%@ page language='java' contentType='text/html; charset=UTF-8'
	pageEncoding='UTF-8'%>
<%@ page import='java.util.*'%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>UMS</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
$(() => {
   userCk();
	
   $('#list').click(() => {
		location.reload();
	});
   
   $('#add').click(()=> {
	   let name = $('input[name=userName]').val();
	   if(name){
		   $.ajax({ 
			url: 'add',
			data: {"userName": name}, 
			success: (result) => {
				if(result) 
					alert("성공", "등록이  완료되었습니다.", "success");
				else
					alert("실패", "등록이 실패되었습니다.", "error");
			},
			error: () => {
				alert("실패", "등록이 실패되었습니다.", "error");
			}
		});
	}else{
		alert("실패", "이름을 입력해주세요", "warning");
	}
});
   $('#edit').click(() => {
		let name = $('input[name=userName]').val();
		let userNo = $('input:checked').val();
		
		if(name && userNo){
			$.ajax({
				url: "edit",
				data: {"userName": name, "userNo": userNo},
				success: (result) => {
					if(result)
						alert("성공", "수정이 완료되었습니다.", "success");
					else
						alert("실패", "수정이 실패되었습니다.", "error");
				},
				error: () => {
					alert("실패", "수정이 실패되었습니다.", "error");
				}
			});
		}else{
			alert("실패", "수정할 사용자를 선택하고 이름을 입력해주세요.", "warning");
		}
	});
	
	$('#remove').click(() => {
		let userNo = $('input:checked').val();
		if(userNo){
			$.ajax({
				url: "remove",
				data: {"userNo": userNo},
				success: (result) => {
					if(result)
						alert("성공", "삭제가 완료되었습니다.", "success");
					else
						alert("실패", "삭제가 실패되었습니다.", "warning");
				},
				error: () => {
					alert("실패", "삭제가 실패되었습니다.", "warning");
				},
			});
		}else{
			alert("실패", "삭제할 사용자를 선택해주세요.", "warning");
		}
	});
});

function userCk(){
	   if($('tbody').find('tr').length == 0){
		   $('<div id= "noUser" class= "alert alert-info" style="text-align: center;">사용자가 없습니다.</div>').insertAfter('table');
	   }else $('#noUser').remove();
	   }

function alert(title, text, type) {
	swal({
		title,
		text,
		type
	}, function() {
		location.reload();
	});
}
</script>
<style>
header {
	border: solid black 1px;
	text-align: center;
}

table, th, td, #msg {
	text-align: center;
}
</style>
</head>
<body>
	<div class='container'>
		<div class='well'>
			<header>
				<h3>U M S</h3>
			</header>
		</div>
		<form>
			<div class='form-group'>
				<input name='userName' type='text' class='form-control'
					placeholder='사용자명' maxlength='3'>
			</div>

			<div class='btn-group btn-group-justified'>
				<div class='btn-group'>
					<button type='button' class='btn btn-default' id='list'>
						<span class='glyphicon glyphicon-list'></span> 목록
					</button>
				</div>
				<div class='btn-group'>
					<button type='button' class='btn btn-default' id='add'>
						<span class='glyphicon glyphicon-plus'></span> 가입
					</button>
				</div>
				<div class='btn-group'>
					<button type='button' class='btn btn-default' id='edit'>
						<span class='glyphicon glyphicon-asterisk'></span> 수정
					</button>
				</div>
				<div class='btn-group'>
					<button type='button' class='btn btn-default' id='remove'>
						<span class='glyphicon glyphicon-remove'></span> 탈퇴
					</button>
				</div>
			</div>
		</form>
		<table class='table table-hover'>
			<thead>
				<tr>
					<th>번호</th>
					<th>이름</th>
					<th>등록일</th>
				</tr>
			</thead>
			<tbody id="userList">
				<c:forEach var='user' items='${users}'>
					<tr>
						<td><input type='radio' name='num' value='${user.userNo}'>
							${user.userNo}</td>
						<td>${user.userName}</td>
						<td>${user.regDate}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>