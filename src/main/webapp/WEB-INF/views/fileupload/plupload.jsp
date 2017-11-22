<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>



<tiles:insertDefinition name="defaultTemplate">
    <tiles:putAttribute name="headBody">
        <link rel="stylesheet" href="<c:url value="/resources/plupload-2.3.6/js/jquery.plupload.queue/css/jquery.plupload.queue.css"/>" type="text/css" />
        <link rel="stylesheet" href="<c:url value="/resources/plupload-2.3.6/js/jquery.ui.plupload/css/jquery.ui.plupload.css"/>" type="text/css" />

        <!-- production -->
        <script type="text/javascript" src="<c:url value="/resources/plupload-2.3.6/js/plupload.full.min.js"/>"></script>
        <script type="text/javascript" src="<c:url value="/resources/plupload-2.3.6/js/jquery.ui.plupload/jquery.ui.plupload.js"/>"></script>
        <script type="text/javascript" src="<c:url value="/resources/plupload-2.3.6/js/jquery.plupload.queue/jquery.plupload.queue.min.js"/>"></script>

        <!-- debug
        <script type="text/javascript" src="../../js/moxie.js"></script>
        <script type="text/javascript" src="../../js/plupload.dev.js"></script>
        <script type="text/javascript" src="../../js/jquery.ui.plupload/jquery.ui.plupload.js"></script>
        -->

        <script type="text/javascript">
            $(function() {
                $("#html5_uploader").pluploadQueue({
                    runtimes : 'html5,flash,silverlight,html4',
                    url : "<c:url value="/plupload/file"/>",
                    chunk_size : '10mb',
                    send_chunk_number: false,
                    rename : true,
                    unique_names : true,
                    resize : {width : 320, height : 240, quality : 90},
                    flash_swf_url : '<c:url value="/resources/plupload-2.3.6/js/Moxie.swf"/>',
                    silverlight_xap_url :'<c:url value="/resources/plupload-2.3.6/js/Moxie.xap"/>',
                    filters : {
                        max_file_size : '5120mb',
                        mime_types: [
                            {title : "Video files", extensions : "mp4"},
                            {title : "Image files", extensions : "jpg,gif,png"},
                            {title : "Zip files", extensions : "zip"}
                        ]
                    }
                });
            });
        </script>

    </tiles:putAttribute>
    <tiles:putAttribute name="contentBody">
        <h3>HTML 5 runtime</h3>
        <div id="html5_uploader">
            Your browser doesn't support native upload.
        </div>

        <a href="<c:url value="/file/download?filePath=C:/Users/gmedia/Desktop/SQL.Server.2008.Full.Setup.zip"/>">다운로드</a>

       </tiles:putAttribute>
</tiles:insertDefinition>