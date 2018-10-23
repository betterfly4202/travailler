¡<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>



<tiles:insertDefinition name="defaultTemplate">
    <tiles:putAttribute name="headBody">

<script src="<c:url value="/resources/js/FileAPI.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/resources/css/dragNdrop-ui.css"/>" media="ALL" />

<script>
    var chunkSize;
    var offset = 0;
    var sendChunkFlag = true;
    var retries = 0; //reset the counter
    var blob = new Blob;
    var delay = window.setTimeout;
    var file,count = 0;
    var uploadURL = "<c:url value="/fileUpload"/>"; //Upload URL

    $(function(){
        $("#files").kendoUpload({

        })


        var objDragAndDrop = $("#dropZone");
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
            handleFileUpload(files,objDragAndDrop);
        });
    });


    //dropBox 에 드래그한 파일 순차적 핸들링
    function handleFileUpload(files,obj){
        for (var i = 0; i < files.length; i++){
            var fileClone = files[i].slice(0, files[i].size);
            console.log(fileClone);
//                    console.log("file URL : "+URL.createObjectURL(fileClone));
            var fd = new FormData();
            fd.append('file', files[i]);
            var status = new createStatusbar(obj); //Using this we can set progress.
            status.setFileNameSize(files[i].name,files[i].size);

            file = files[i];
            file.webkitSlice
            console.log(" oriGsize : "+file.originalSize + ", size : "+file.size);

            //plupload 참조
            if(file.loaded){
                offset = file.loaded = chunkSize ? chunkSize * Math.floor(files[i].loaded / chunkSize) : 0;
                console.log("offset : "+offset);
            }
//            uploadNextChunk(files[i]);
//            sendFileToServer(fd,status);
        }
    }

    // Chunk Handling
    function uploadNextChunk(){
        var chunkBlob, args = {}, curChunkSize;

        if(chunkSize && blob.size > chunkSize){
            curChunkSize = Math.min(chunkSize, blob.size - offset);
            chunkBlob = blob.slice(offset, offset + curChunkSize);
        }else{
            curChunkSize = blob.size;
            chunkBlob = blob;
        }

        if(chunkSize){
            if(sendChunkFlag){
                args.chunk = Math.ceil(offset / chunkSize);
                args.chunks = Math.ceil(blob.size / chunkSize);
            }else{
                args.offset = offset;
                args.total = blob.size;
            }
        }

        uploadChunk(args, chunkBlob, curChunkSize);
    }

    function uploadChunk(args, chunkBlob, curChunkSize){
        var formData;

        var xhr = new XMLHttpRequest();

        if(xhr.upload){
            xhr.upload.onprogress = function(e){
                file.loaded = Math.min(file.size, offset + e.loaded);
            }
        }

        xhr.onload = function(){
            if(xhr.status < 200 || xhr.status >= 400){
                alert("upload request error ! ");
                return;
            }
        }

        if(curChunkSize < blob.size){
            chunkBlob.destroy();

            offset += curChunkSize;
            file.loaded = Math.min(offset, blob.size);

        }else{
            file.loaded = file.size;
        }

        chunkBlob = formData = null;

        if(!offset || offset >= blob.size){
            if(file.size != file.origSize){
                blob.destroy();
                blob = null;
            }
            file.status;
            console.log("file stats : "+file.status);
            file.completeTimestamp = +new Data();
        }else{
            delay(uploadNextChunk(file), 1);
        }

        xhr.onerror = function(){
            alert("error !");
        }

        xhr.onloadend = function(){
            alert("file upload destroy");
            this.destroy();
        }

        xhr.open("POST", uploadURL, true);

        formData = new xhr.FormData();
        xhr.send(formData);
    }

    // making progress bar
    var rowCount=0;
    function createStatusbar(obj){
        rowCount++;
        var row="odd";
        if(rowCount %2 ==0) row ="even";
        this.statusbar = $("<div class='statusbar "+row+"'></div>");
        this.filename = $("<div class='filename'></div>").appendTo(this.statusbar);
        this.size = $("<div class='filesize'></div>").appendTo(this.statusbar);
        this.progressBar = $("<div class='progressBar'><div></div></div>").appendTo(this.statusbar);
        this.abort = $("<div class='abort'>중지</div>").appendTo(this.statusbar);

        obj.after(this.statusbar);

        this.setFileNameSize = function(name,size){
            var sizeStr="";
            var sizeKB = size/1024;
            if(parseInt(sizeKB) > 1024){
                var sizeMB = sizeKB/1024;
                sizeStr = sizeMB.toFixed(2)+" MB";
            }else{
                sizeStr = sizeKB.toFixed(2)+" KB";
            }

            this.filename.html(name);
            this.size.html(sizeStr);
        }
        this.setProgress = function(progress){
            var progressBarWidth =progress*this.progressBar.width()/ 100;
            this.progressBar.find('div').animate({ width: progressBarWidth }, 10).html(progress + "% ");
            if(parseInt(progress) >= 100)
            {
                this.abort.hide();
            }
        }

        this.setAbort = function(jqxhr){
            var sb = this.statusbar;
            this.abort.click(function()
            {
                jqxhr.abort();
                sb.hide();
            });
        }
    }

    //서버전송
    function sendFileToServer(fd,status){

        var extraData ={}; //Extra Data.
        var jqXHR=$.ajax({
            xhr: function() {
                var xhrobj = $.ajaxSettings.xhr();
                if (xhrobj.upload) {
                    xhrobj.upload.addEventListener('progress', function(event) {
                        var percent = 0;
                        var position = event.loaded || event.position;
                        var total = event.total;
                        if (event.lengthComputable) {
                            percent = Math.ceil(position / total * 100);
                        }
                        //Set progress
                        status.setProgress(percent);
                    }, false);
                }
                return xhrobj;
            },
            url: uploadURL,
            type: "POST",
            contentType:false,
            processData: false,
            cache: false,
            data: fd,
            success: function(data){
                status.setProgress(100);
                //$("#status1").append("File upload Done<br>");
            }
        });

        status.setAbort(jqXHR);
    }
</script>

    </tiles:putAttribute>
    <tiles:putAttribute name="contentBody">
        <pre id="preview">텍스트 파일 내용 출력 영역</pre>
        <div id="dropZone" class="dragAndDropDiv">

        </div>
        <input type="file" id="getFile" accept="text/*">

        <div id="droptarget" style="width:300px; height:150px;">이미지 파일을 드롭하십시오</div>
    </tiles:putAttribute>
</tiles:insertDefinition>