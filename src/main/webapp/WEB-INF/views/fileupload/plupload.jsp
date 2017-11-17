<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>



<tiles:insertDefinition name="defaultTemplate">
    <tiles:putAttribute name="headBody">

        <style>


        </style>

        <link rel="stylesheet" href="<c:url value="/resources/plupload-2.3.6/js/jquery.plupload.queue/css/jquery.plupload.queue.css"/>" type="text/css" />
        <link rel="stylesheet" href="<c:url value="/resources/plupload-2.3.6/js/jquery.ui.plupload/css/jquery.ui.plupload.css"/>" type="text/css" />

        <link rel="stylesheet" href="//ajax.googleapis.com/ajax/libs/jqueryui/1.8.9/themes/base/jquery-ui.css" type="text/css" />
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
        <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js"></script>

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
                // Setup html5 version
                $("#html5_uploader").pluploadQueue({
                    // General settings
                    runtimes : 'html5,flash,silverlight,html4',
                    url : "<c:url value="/plupload/file"/>",
                    //chunk_size : '1mb',
                    unique_names : true,
                    filters : {
                        max_file_size : '5000mb',
                        mime_types: [
                            {title : "Image files", extensions : "jpg,gif,png"},
                            {title : "Video files", extensions : "mp4"},
                            {title : "Zip files", extensions : "zip"}
                        ]
                    },
                    // Resize images on clientside if we can
                    resize : {width : 320, height : 240, quality : 90},
                    flash_swf_url : '<c:url value="/resources/plupload-2.3.6/js/Moxie.swf"/>',
                    silverlight_xap_url :'<c:url value="/resources/plupload-2.3.6/js/Moxie.xap"/>'
                });
            });
        </script>

    </tiles:putAttribute>
    <tiles:putAttribute name="contentBody">
        <h3>HTML 5 runtime</h3>
        <div id="html5_uploader">Your browser doesn't support native upload.</div>

       </tiles:putAttribute>
</tiles:insertDefinition>