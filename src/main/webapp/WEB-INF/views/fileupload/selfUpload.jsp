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
                    var reader = new FileReader();
                    reader.readAsDataURL(files[i]);
                    reader.onload = function(){
                        var image = document.createElement('img');
                        image.width = 400;
                        image.height = 300;
                        image.src = reader.result;
                        console.log("image : "+image);
                        document.body.appendChild(image);

                    }
                    sliceBlob(files[i]);
//                    sendFileToServer(fd,status);
                }
            }


            /**
             *
             * @param fileSlices
             * 해야할 일
             * URL.createObjectURL(blob)으로 담아서
             * url로 받은 blob을 ajax로 서버에 전송하여 담음
             * 서버에선 그 blob을 temp 파일로 담아서 파일 전송시 완료시킴
             *
             * 1. createObjectURL 생성
             * 2. 파일 쪼개기 (10MB 정도의 크기)
             * 3. ajax 구현하여 서버 전송
             * 4. 서버에서 temp 파일로 blob파일 쌓기
             * 5. 완료
             *
             * blob 활용법 (blob.slice) : https://taegon.kim/archives/5078
             * fileSize 쪼개기 예제 : https://developer.mozilla.org/en-US/docs/Web/API/File/Using_files_from_web_applications#Example_Using_object_URLs_to_display_images
             * 깔끔한 file blob 처리 : http://h5homom.tistory.com/entry/html5-File
             * HTML5 File UPload API : http://www.codejs.co.kr/development/views/file-upload/
             * URL method : Lhttp://www.javascripture.com/UR
             */

            function sliceBlob(fileSlices){
                var blob = new Blob([fileSlices],
                    {type : 'application/octet-binary'}
                );
                blob.slice()
                var reader = new FileReader();
                reader.onload =  function(){
                    console.log("onload function");
                };
                reader.readAsArrayBuffer(blob);


                var blobUrl = URL.createObjectURL(fileSlices);
                console.log("blob url : "+blobUrl);

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
                    url:  "<c:url value="/fileUpload"/>",
                    type: "POST",
                    contentType:false,
                    processData: false,
                    cache: false,
                    data: blobUrl,
                    success: function(data){
                        status.setProgress(100);
                        //$("#status1").append("File upload Done<br>");
                    }
                });
                status.setAbort(jqXHR);
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

            function sendFileToServer(fd,status){
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
            }
        </script>
¡
    </tiles:putAttribute>
    <tiles:putAttribute name="contentBody">
        <%--&lt;%&ndash;<div class="statusbar" name="statusBar[]"></div>&ndash;%&gt;--%>
        <%--<div class="filename"></div>--%>
        <%--<div class="filesize"></div>--%>
        <%--<div class="progressBar"><div></div></div>--%>
        <%--<div class="abort">중지</div>--%>

        <pre id="preview">텍스트 파일 내용 출력 영역</pre>
        <div id="dropZone" class="dragAndDropDiv">

        </div>
        <input type="file" id="getFile" accept="text/*">

        <div id="droptarget" style="width:300px; height:150px;">이미지 파일을 드롭하십시오</div>
    </tiles:putAttribute>
</tiles:insertDefinition>