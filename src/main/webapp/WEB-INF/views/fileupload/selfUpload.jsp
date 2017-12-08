<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>



<tiles:insertDefinition name="defaultTemplate">
    <tiles:putAttribute name="headBody">

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

    .progressBar {
        width: 200px;
        height: 22px;
        border: 1px solid #ddd;
        border-radius: 5px;
        overflow: hidden;
        display:inline-block;
        margin:0px 10px 5px 5px;
        vertical-align:top;
    }

    .progressBar div {
        height: 100%;
        color: #fff;
        text-align: right;
        line-height: 22px; /* same as #progressBar height if we want text middle aligned */
        width: 0;
        background-color: #0ba1b5; border-radius: 3px;
    }
    .statusbar{
        border-top:1px solid #A9CCD1;
        min-height:25px;
        width:99%;
        padding:10px 10px 0px 10px;
        vertical-align:top;
    }
    .statusbar:nth-child(odd){
        background:#EBEFF0;
    }
    .filename{
        display:inline-block;
        vertical-align:top;
        width:250px;
    }
    .filesize{
        display:inline-block;
        vertical-align:top;
        color:#30693D;
        width:100px;
        margin-left:10px;
        margin-right:5px;
    }
    .abort{
        background-color:#A8352F;
        -moz-border-radius:4px;
        -webkit-border-radius:4px;
        border-radius:4px;display:inline-block;
        color:#fff;
        font-family:arial;font-size:13px;font-weight:normal;
        padding:4px 15px;
        cursor:pointer;
        vertical-align:top
    }

</style>


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

            $(document).on('dragenter', function (e){
                e.stopPropagation();
                e.preventDefault();
            });
            $(document).on('dragover', function (e){
                e.stopPropagation();
                e.preventDefault();
                objDragAndDrop.css('border', '2px dotted #0B85A1');
            });
            $(document).on('drop', function (e){
                e.stopPropagation();
                e.preventDefault();
            });


        function handleFileUpload(files,obj){
                for (var i = 0; i < files.length; i++){


                    var fileClone = files[i].slice(0, files[i].size);
                    console.log(fileClone);
                    console.log(URL.createObjectURL(fileClone));

                    var fd = new FormData();
                    fd.append('file', files[i]);
                    var status = new createStatusbar(obj); //Using this we can set progress.
                    status.setFileNameSize(files[i].name,files[i].size);
//                    sendFileToServer(fd,status);
                }
            }
        });


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
         * URL method : http://www.javascripture.com/URL
         */

        function sliceBlob(fileSlices){
            var blob = new Blob([fileSlices],
                        {type : 'application/octet-binary'}
                    );

//            var blobUrl = window.URL.createObjectURL(blob);

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
    </tiles:putAttribute>
</tiles:insertDefinition>