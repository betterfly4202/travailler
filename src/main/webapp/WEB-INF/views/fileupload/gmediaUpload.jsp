<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>



<tiles:insertDefinition name="defaultTemplate">
    <tiles:putAttribute name="headBody">

    <script src="<c:url value="/resources/js/FileAPI.js"/>"></script>
    <link rel="stylesheet" href="<c:url value="/resources/css/dragNdrop-ui.css"/>" media="ALL" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <style>
        .progress {
            color:#fff;
        }
        .meter {
            width:0%;
            font-size: 12px;
            padding: .3em;
        }
    </style>

    <%--<script src="<c:url value="/resources/js/GmediaUpload.js"/>"></script>--%>
    <script>

    $(function(){
        //        var dropFile = $("#dropZone");
        $(document).on("dragenter",".dragAndDropDiv",function(e){
            e.stopPropagation();
            e.preventDefault();
            $(this).css('border', '2px solid #0B85A1');
        });

        $(document).on("dragover",".dragAndDropDiv",function(e){
            e.stopPropagation();
            e.preventDefault();
        });

        $(document).on("drop",".dragAndDropDiv",function(e){
            $(this).css('border', '2px dotted #0B85A1');
            e.preventDefault();
            var files = e.originalEvent.dataTransfer.files;
            handlingFileUpload(files);
        });
    });

    var FILE_INFO, FILE_NAME, TOTAL_CHUNK;
    var uploaders = [];
    var bars = document.getElementById('bars'),
        progress = document.createElement('div'),
        meter = document.createElement('span');
    var CHUNK_COUNT = 0;

    function handlingFileUpload(files){
        for(var i =0; i<files.length; i++){
            var file = files[i];
            sliceFromFile(file);
        }
    }

    function sliceFromFile(file){
        var CHUNK_SIZE, FILE_SIZE, start, end;

        FILE_SIZE = file.size;
        FILE_NAME = file.name;
        CHUNK_SIZE = '10485760'; //10MB
        CHUNK_SIZE = parseInt(CHUNK_SIZE, 10); // 10진수로 인트 파싱
        TOTAL_CHUNK = Math.max(Math.ceil(FILE_SIZE / CHUNK_SIZE),1);
        start = 0;
        end = CHUNK_SIZE;

        //file을 json으로 던지고싶음...
        //        FILE_INFO = JSON.stringify({
        //            fileName : FILE_NAME,
        //            filePieceChunk : CHUNK_SIZE.toString(10),
        //            fileTotalChunk : TOTAL_CHUNK.toString(10)
        //        });
        console.log("chunk_size : "+CHUNK_SIZE+ ", || total_chunk : "+TOTAL_CHUNK);
        while(start < FILE_SIZE){
            gmediaFileUpload(file.slice(start, end));
            start = end;
            end = start + CHUNK_SIZE;
        }
    }

    gmediaFileUpload = function(blobFile){
        var formData = new FormData;

        var xhr = new XMLHttpRequest();
        xhr.open('POST','<c:url value="/fileUpload"/>', false);

        formData.append("file", blobFile);
        formData.append("fileName", FILE_NAME);
        formData.append("CHUNK_COUNT",CHUNK_COUNT);
        formData.append("TOTAL_CHUNKS",TOTAL_CHUNK);
        xhr.setRequestHeader("Cache-Control","no-cache");
        xhr.setRequestHeader("Pragma","no-cache");
        xhr.setRequestHeader("Expires","0");

        xhr.upload.onprogress = function (e) {
            console.log("length ? "+e.lengthComputable);
            if (e.lengthComputable) {
                meter.value = Math.round((e.loaded / e.total) * 100);
                meter.textContent = parseFloat(meter.value) + '%';
                meter.style.width = meter.textContent;
            }
            if (meter.textContent === '100%') progress.classList.add('success');

        };

        xhr.onloadend = function (e) {
            uploaders.pop();
            if (!uploaders.length) {
                bars.appendChild(document.createTextNode(' All Done! '));
            }
        };
        uploaders.push(xhr);

        xhr.send(formData);
        CHUNK_COUNT++;
    }


    window.onload  = function() {
        var bars = document.getElementById('bars'),
            uploaders = [],
            upload,
            chooseFile,
            fileName,
            TOTAL_CHUNKS;
        var CHUNK_COUNT = 0;

        upload = function (blobOrFile) {
            var formData = new FormData;

            var progress = document.createElement('div'),
                meter = document.createElement('span');
            progress.classList.add('progress');
            meter.classList.add('meter');
            bars.appendChild(progress);
            progress.appendChild(meter);

            var xhr = new XMLHttpRequest();
            xhr.open('POST', '<c:url value="/fileUpload"/>', false);
            formData.append("file",blobOrFile);
            formData.append("fileName",fileName);
            formData.append("CHUNK_COUNT",CHUNK_COUNT);
            formData.append("TOTAL_CHUNKS",TOTAL_CHUNKS);
            xhr.setRequestHeader("Cache-Control","no-cache");
            xhr.setRequestHeader("Pragma","no-cache");
            xhr.setRequestHeader("Expires","0");

            xhr.upload.onprogress = function (e) {
                console.log("length ? "+e.lengthComputable);
                if (e.lengthComputable) {
                    meter.value = Math.round((e.loaded / e.total) * 100);
                    meter.textContent = parseFloat(meter.value) + '%';
                    meter.style.width = meter.textContent;
                }
                if (meter.textContent === '100%') progress.classList.add('success');
            };
            xhr.onloadend = function (e) {
                uploaders.pop();
                if (!uploaders.length) {
                    bars.appendChild(document.createTextNode(' All Done! '));
                }
            };
            uploaders.push(xhr);
    //            xhr.send(blobOrFile);
            xhr.send(formData);
            CHUNK_COUNT++;

        };

        chooseFile = document.getElementById("file");
        chooseFile.addEventListener('change', function (e) {
            var self = e.currentTarget,
                blob = self.files[0],
                BYTES_PER_CHUNK, SIZE, start, end;

            fileName = blob.name;
            BYTES_PER_CHUNK = parseInt(document.getElementById('numChunks').value, 10);
            SIZE = blob.size;
            TOTAL_CHUNKS = Math.max(Math.ceil(SIZE / BYTES_PER_CHUNK), 1);
            bars.innerHTML = '';
            bars.innerHTML = '<p>Sending <b>' + TOTAL_CHUNKS + '</b> chunks:</p>';
            start = 0;
            end = BYTES_PER_CHUNK;

            console.log("BYTES_PER_CHUNK : "+BYTES_PER_CHUNK + "// TOTAL_CHUNKS : " + TOTAL_CHUNKS);

            while (start < SIZE) {
                upload(blob.slice(start, end));
                start = end;
                end = start + BYTES_PER_CHUNK;
            }
        }, false);
    }

    </script>

    </tiles:putAttribute>
    <tiles:putAttribute name="contentBody">

        <div id="dropZone" class="dragAndDropDiv">

        <%--<div class="row">--%>
            <%--<div class="large-12 column">--%>
                <%--<p>Chunk Size: 10mb (10485760 bytes) / (5242880) </p>--%>
                <%--<input type="number" min="10485760" value="10485760" id="numChunks" />--%>

                <%--<input type="file" id="file" />--%>
                <%--<div id="done"></div>--%>
                <%--<div id="bars"></div>--%>
                <%--<button type="button" id="uploadButton">파일전송</button>--%>
            <%--</div>--%>
        <%--</div>--%>

    </tiles:putAttribute>
</tiles:insertDefinition>