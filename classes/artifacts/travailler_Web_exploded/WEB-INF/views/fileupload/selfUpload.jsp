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

            $(function(){
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

            function handleFileUpload(files,obj){
                for (var i = 0; i < files.length; i++){
                    var fileClone = files[i].slice(0, files[i].size);
                    console.log(fileClone);
//                    console.log("file URL : "+URL.createObjectURL(fileClone));
                    var fd = new FormData();
                    fd.append('file', files[i]);
                    var status = new createStatusbar(obj); //Using this we can set progress.
                    status.setFileNameSize(files[i].name,files[i].size);
                    sendFileToServer(files[i]);
                }
            }

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

            function sendFileToServer(file){
                var uploadURL = "<c:url value="/fileUpload"/>"; //Upload URL
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

                var start = 10485760; // 10MB
                var length = file.size - start;
                var chunk = file.slice(start, length);

                console.log("chunk size : "+chunk);
                var xhr = new XMLHttpRequest();

                xhr.open('POST','<c:url value="/fileUpload"/>' , true);
                xhr.setRequestHeader("Cache-Control","no-cache");
                xhr.setRequestHeader("X-Requested_with", "XMLHttpRequest");
//                xhr.setRequestHeader("X-File-Name", file.name);
//                xhr.setRequestHeader("X-File-Size", file.size);
                xhr.send(chunk);
            }
        </script>
        ¡
    </tiles:putAttribute>
    <tiles:putAttribute name="contentBody">
        <pre id="preview">텍스트 파일 내용 출력 영역</pre>
        <div id="dropZone" class="dragAndDropDiv">

        </div>
        <input type="file" id="getFile" accept="text/*">

    </tiles:putAttribute>
</tiles:insertDefinition>