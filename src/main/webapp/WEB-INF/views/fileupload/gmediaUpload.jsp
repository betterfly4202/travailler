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

    <script>

    var dropBox = $("#dropZone");

    var FILE_INFO, FILE_NAME, TOTAL_CHUNK;
    var bars = document.getElementById('bars'),
        progress = document.createElement('div'),
        meter = document.createElement('span');
    var CHUNK_COUNT = 0;

    $(function(){

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


    function handlingFileUpload(files){
        for(var i =0; i<files.length; i++){
            var file = files[i];
            var status = new createStatusBar(dropBox);
            status.setFileStatus(file.name, file.size);
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
        console.log("counts : "+CHUNK_COUNT);
    }

    gmediaFileUpload = function(blobFile){
        var formData = new FormData;
        var status = new createStatusBar(dropBox);
        formData.append("file", blobFile);
        formData.append("fileName", FILE_NAME);
        formData.append("CHUNK_COUNT",CHUNK_COUNT);
        formData.append("TOTAL_CHUNKS",TOTAL_CHUNK);
//        uploaders.push(xhr);
//        xhr.send(formData);

//        var fileData = {
//            file : blobFile,
//            fileName : FILE_NAME,
//            CHUNK_COUNT : CHUNK_COUNT,
//            TOTAL_CHUNKS : TOTAL_CHUNK
//        }ss

        var jqXHR = $.ajax({
            xhr : function(){
                var xhrObj = $.ajaxSettings.xhr();
                if(xhrObj.upload){
                    xhrObj.upload.addEventListener('progress', function(e){
                        var percent = 0;
                        var position = e.loaded || e.position;
                        var total = e.total;
                        if(e.lengthComputable){
                            percent = Math.ceil(position / total * 100);
                        }
                        status.setProgress(percent);
                        console.log(percent);
                    }, false);
                }
                return xhrObj;
            },
            url : '<c:url value="/fileUpload"/>',
            async : false,
            type : 'POST',
            contentType:false,
            processData: false,
            dataType : 'json',
            data : formData,
            success : function(data){
                status.setProgress(100);
//                CHUNK_COUNT++;
            }
        });
        status.setAbort(jqXHR);
        CHUNK_COUNT++;
    }

    var rowCount = 0;
    function createStatusBar(dropBox){
        rowCount++;
        var row = "odd";
        if(rowCount % 2 == 0) row = "even";

        this.statusbar = $("<div class='statusbar "+row+"'></div>");
        this.filename = $("<div class='filename'></div>").appendTo(this.statusbar);
        this.size = $("<div class='filesize'></div>").appendTo(this.statusbar);
        this.progressBar = $("<div class='progressBar'><div></div></div>").appendTo(this.statusbar);
        this.abort = $("<div class='abort'>중지</div>").appendTo(this.statusbar);

        dropBox.after(this.statusbar);

        this.setFileStatus = function(name, size){
            console.log("name :" +name+ " /// size : "+size);
            var sizeStr = "";
            var sizeKB = size/1024;
            if(parseInt(sizeKB) > 1024){
                var sizeMB = sizeKB / 1024;
                sizeStr = sizeMB.toFixed(2) + "MB";
            }else{
                sizeStr = sizeKB.toFixed(2) + "KB";
            }
            this.filename.html(name);
            this.size.html(sizeStr);
        }

        this.setProgress = function(progress) {
            var progressBarWidth = progress * this.progressBar.width() / 100;
            console.log("progress : "+progress + ", // barWidth : "+progressBarWidth);
            this.progressBar.find('div').animate({width: progressBarWidth}, 10).html(progress + "%");
            if (parseInt(progress) >= 100){
                this.abort.hide();
            }
        }

        this.setAbort = function(xhr){
            var sb = this.statusbar;
            this.abort.click(function(){
                xhr.abort();
                sb.hide();
            });
        }
    }
    </script>

    </tiles:putAttribute>
    <tiles:putAttribute name="contentBody">

        <div id="dropZone" class="dragAndDropDiv">

    </tiles:putAttribute>
</tiles:insertDefinition>