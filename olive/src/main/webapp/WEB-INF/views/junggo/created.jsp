<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<style type="text/css">
.ck.ck-editor {
	max-width: 97%;
}
.ck-editor__editable {
	min-height: 250px;
}
.ck-content .image>figcaption{
	min-height: 25px;
}

.table-content tr > td:nth-child(1) {
	width: 100px;
	text-align: center;
	background: #eee;
}
.table-content tr > td:nth-child(2) {
	padding-left: 10px;
}
.table-content input[type=text], .table-content input[type=file], .table-content textarea {
	width: 97%;
}
</style>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/ckeditor5/build/ckeditor.js"></script>
<script type="text/javascript">
    function sendOk() {
        var f = document.junggoForm;

    	var str = f.subject.value;
        if(!str) {
            alert("제목을 입력하세요. ");
            f.subject.focus();
            return;
        }
        
        str = window.editor.getData(); // 값 가져오기
        if(! str) {
        	alert("내용을 입력하세요. ");
        	window.editor.focus();
        	return;
        }
        f.content.value = str;

    	f.action="${pageContext.request.contextPath}/junggo/${mode}";
        f.submit();
    }
</script>


<div class="container body-container">
	<div class="body-title">
		<h2> 중고게시판 글쓰기 </h2>
	</div>
	
	<div class="body-main">
		<form name="junggoForm" method="post" enctype="multipart/form-data">
		<table class="table table-border table-content">
			<tr>
				<td>카테고리</td>
				<td>
					<select name="categoryNum" ${ mode='update' ? "disabled='disabled'":""}>
						<c:forEach var="vo" items="${listCategory}">
							<option value="${vo.categoryNum}" ${dto.categoryNum==vo.categoryNum ? "selected='selected'":""}>${vo.categoryName}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
		
			<tr>
				<td>제&nbsp;&nbsp;&nbsp;&nbsp;목</td>
				<td>
					<input type="text" name="subject" maxlength="100" class="boxTF" value="${dto.subject}">
				</td>
			</tr>
			
			<tr>
				<td>가&nbsp;&nbsp;&nbsp;&nbsp;격</td>
				<td>
					<input type="text" name="price" class="boxTF" value="${dto.price}">
				</td>
			</tr>
			
			<tr>
				<td>작성자</td>
				<td>
					${sessionScope.member.userName}
				</td>
			</tr>
			
			<tr>
				<td valign="top">내&nbsp;&nbsp;&nbsp;&nbsp;용</td>
				<td valign="top">
					<div id="editor">${dto.content}</div>
					<input type="hidden" name="content">
				</td>				
			</tr>
			
			<tr>
				<td>이미지</td>
				<td>
					<div class="imgPreView"></div>
					<input type="file" name="upload" class="boxTF" accept="image/*" style="display: none;">
				</td>
			</tr>
		</table>
			
		<table class="table">
			<tr>
				<td align="center">
					<button type="button" onclick="sendOk();" class="btn btn-dark">${mode=='update'?'수정완료':'등록하기'}</button>
					<button type="reset" class="btn">다시입력</button>
					<button type="button" class="btn" onclick="javascript:location.href='${pageContext.request.contextPath}/junggo/list';">${mode=='update'?'수정취소':'등록취소'}</button>
						<c:if test="${mode=='update'}">
							<input type="hidden" name="num" value="${dto.num}">
							<input type="hidden" name="page" value="${page}">
						</c:if>
				</td>
			</tr>	
		</table>
		</form>
	</div>
	
	<script type="text/javascript">
ClassicEditor
.create( document.querySelector( '#editor' ), {
	toolbar: {
		items: [
			'heading', '|',
			'bold', 'italic', 'link', 'alignment', 'bulletedList', 'numberedList', '|',
			'outdent', 'indent', '|',
			'imageUpload', 'blockQuote', 'insertTable', 'mediaEmbed', 'htmlEmbed', 'undo', 'redo'
		]
	},
	image: {
		toolbar: [
            'imageStyle:full',
            'imageStyle:side',
            '|',
            'imageTextAlternative'
        ],

        // The default value.
        styles: [
            'full',
            'side'
        ]
	},
	language: 'ko',
	ckfinder : {
		uploadUrl : '${pageContext.request.contextPath}/jcimage/upload' // 업로드 URL. POST로 감
	}
} )
.then( editor => {
	window.editor = editor;
} )
.catch( error => {
	console.error( error );
} );

</script>  
	
</div>