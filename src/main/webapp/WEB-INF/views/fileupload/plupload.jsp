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
        <%--<script type="text/javascript" src="<c:url value="/resources/plupload-2.3.6/js/jquery.plupload.queue/jquery.plupload.queue.min.js"/>"></script>--%>
        <script type="text/javascript" src="<c:url value="/resources/plupload-2.3.6/js/jquery.plupload.queue/jquery.plupload.queue.js"/>"></script>

        <!-- debug
        <script type="text/javascript" src="../../js/moxie.js"></script>
        <script type="text/javascript" src="../../js/plupload.dev.js"></script>
        <script type="text/javascript" src="../../js/jquery.ui.plupload/jquery.ui.plupload.js"></script>
        -->

        <script type="text/javascript">
            <%--$(function() {--%>
                <%--$("#uploader").pluploadQueue({--%>
                    <%--runtimes : 'html5,flash,silverlight,html4',--%>
                    <%--url : "<c:url value="/plupload/file"/>",--%>
                    <%--chunk_size : '10mb',--%>
                    <%--rename: true,--%>
                    <%--resize : {width : 200, height : 240, quality : 100},--%>
                    <%--flash_swf_url : '<c:url value="/resources/plupload-2.3.6/js/Moxie.swf"/>',--%>
                    <%--silverlight_xap_url :'<c:url value="/resources/plupload-2.3.6/js/Moxie.xap"/>',--%>
                    <%--filters : {--%>
                        <%--prevent_duplicates : true,--%>
                        <%--max_file_size : '5120mb',--%>
                        <%--mime_types: [--%>
                            <%--{title : "Video files", extensions : "mp4"},--%>
                            <%--{title : "Image files", extensions : "jpg,gif,png"},--%>
                            <%--{title : "Zip files", extensions : "zip"}--%>
                        <%--]--%>
                    <%--}--%>
                <%--});--%>
            <%--});--%>

            $(function() {
                $("#uploader").plupload({
                    runtimes : 'html5,flash,silverlight,html4',
                    url : "<c:url value="/plupload/file"/>",

                    max_file_size : '5120mb',
                    chunk_size: '1mb',
                    resize : {
                        width : 200,
                        height : 200,
                        quality : 90,
                        crop: true // crop to exact dimensions
                    },
                    filters : [
                        {title : "Image files", extensions : "jpg,gif,png"},
                        {title : "Video files", extensions : "mp4"},
                        {title : "Text files", extensions : "txt"},
                        {title : "Zip files", extensions : "zip,avi"}
                    ],
                    rename: true,
                    sortable: true,
                    dragdrop: true,
                    views: {
                        list: true,
                        thumbs: true, // Show thumbs
                        active: 'thumbs'
                    },
                    flash_swf_url : '<c:url value="/resources/plupload-2.3.6/js/Moxie.swf"/>',
                    silverlight_xap_url :'<c:url value="/resources/plupload-2.3.6/js/Moxie.xap"/>',
                });
            });

        </script>

    </tiles:putAttribute>
    <tiles:putAttribute name="contentBody">
        <h3>HTML 5 runtime</h3>
        <div id="uploader">
            Your browser doesn't support native upload.
        </div>

        <a href="<c:url value="/file/download?filePath=C:/Users/gmedia/Desktop/SQL.Server.2008.Full.Setup.zip"/>">다운로드</a>

       </tiles:putAttribute>
</tiles:insertDefinition>