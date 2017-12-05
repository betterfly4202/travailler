<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>



<tiles:insertDefinition name="defaultTemplate">
    <tiles:putAttribute name="headBody">

<script type="text/javascript" src="<c:url value="/resources/js/fileupload/map.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/fileupload/stringBuffer.js"/>"></script>

<style>
    .dragAndDropDiv {
        border: 2px dashed #92AAB0;
        width: 650px;
        height: 200px;
        color: #92AAB0;
        text-align: center;
        vertical-align: middle;
        padding: 10px 0px 10px 10px;
        font-size:200%;
        display: table-cell;
    }
</style>


    <script>

        <%--$(function(){--%>
            <%--$("#fileUpload").append("<input type=text value='"+files.name()+"'/>");--%>
        <%--}--%>

        <%--var files = [];--%>
        <%--$(document).on("change","#fileLoader",function(event) {--%>
            <%--$("#fileUpload").append("<input type=text value='"+files.name()+"'/>");--%>
            <%--files=event.target.files;--%>
        <%--})--%>

        <%--$(document).on("click","#fileSubmit",function() {--%>
            <%--processUpload();--%>
        <%--})--%>

        <%--function processUpload(){--%>
            <%--var oMyForm = new FormData();--%>
            <%--oMyForm.append("file", files[0]);--%>

            <%--$.ajax({--%>
                <%--dataType : 'json',--%>
                <%--url : "<c:url value="/fileUpload"/>",--%>
                <%--data : oMyForm,--%>
                <%--type : "POST",--%>
                <%--enctype: 'multipart/form-data',--%>
                <%--processData: false,--%>
                <%--contentType:false,--%>
                <%--success : function(result) {--%>
                    <%--alert(result);--%>
                <%--},--%>
                <%--error : function(result){--%>
                    <%--//...;--%>
                <%--}--%>
            <%--});--%>
        <%--}--%>



        var file = document.querySelector("#getFile");
        file.onchange = function(){
            var fileList = file.files;

            //읽기
            var reader = new FileReader();
            reader.readAsText(fileList[0]);

            //로드한 후
            reader.onload = function(){
                document.querySelector("#preview").textContent = reader.result;
            };
        };
    </script>

    </tiles:putAttribute>
    <tiles:putAttribute name="contentBody">
        <pre id="preview">텍스트 파일 내용 출력 영역</pre>
        <input type="file" id="getFile" accept="text/*">


    </tiles:putAttribute>
</tiles:insertDefinition>