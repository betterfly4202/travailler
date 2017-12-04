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

        var files = [];
        $(document)
            .on(
                "change",
                "#fileLoader",
                function(event) {
                    files=event.target.files;
                })

        $(document)
            .on(
                "click",
                "#fileSubmit",
                function() {
                    processUpload();
                })

        function processUpload()
        {
            var oMyForm = new FormData();
            oMyForm.append("file", files[0]);
            $
                .ajax({dataType : 'json',
                    url : "the url",
                    data : oMyForm,
                    type : "POST",
                    enctype: 'multipart/form-data',
                    processData: false,
                    contentType:false,
                    success : function(result) {
                        //...;
                    },
                    error : function(result){
                        //...;
                    }
                });
        }
    </script>

    </tiles:putAttribute>
    <tiles:putAttribute name="contentBody">
    <div id="fileUpload" class="dragAndDropDiv" style="height:300px;">Drag & Drop Files Here
        <input type="file" name="file" id="fileLoader" />
        <input type="button" id="fileSubmit" value="Upload"/>
    </div>
    </tiles:putAttribute>
</tiles:insertDefinition>