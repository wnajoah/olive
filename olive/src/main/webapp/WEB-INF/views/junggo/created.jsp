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
.btn {
	color:#333;
	font-weight: 500;
	border:1px solid #ccc;
	background-color:#fff;
	text-align:center;
	vertical-align: middle;
	padding:6px 13px;
	border-radius: 3px;
	cursor: pointer;
}
.btn:active, .btn:focus, .btn:hover {
	background-color:#e6e6e6;
	border-color: #adadad;
	color: #333;
}
.btn[disabled], fieldset[disabled] .btn {
	pointer-events: none;
	cursor: not-allowed;
	filter: alpha(opacity=65);
	-webkit-box-shadow: none;
	box-shadow: none;
	opacity: .65;
}

.btn-dark {
    background: #424951;
	border:1px solid #2f3741;
    color:#fff;
}
.btn-dark:hover, .btn-dark:active, .btn-dark:focus {
    background: #333;
   	border:1px solid #222;
   	color:#fff;
}

.boxTF {
	border:1px solid #999;
	padding:5px 5px 5px;
	border-radius:4px;
	background-color:#fff;
	vertical-align: middle;
}
.boxTF[readonly] {
	background-color:#eeeeee;
	/* border: none;*/
}
.body-container {
	display: block;
	padding-top: 10px;
}

.div-title span {
    padding-top: 10px;
    font-size: 27px;
    font-weight: 800;
}
.div-title{
	border-bottom: 1px solid black;
    padding-bottom: 20px;
	margin-bottom: 30px;
}
.table-content tr > td:nth-child(1) {
	background-color: #afb42b;
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


<div class="container body-container" style="margin-top: 100px;">
	<div class="div-title">
		<span> 주고받는 올리브 </span>
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