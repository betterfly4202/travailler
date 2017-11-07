<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE HTML>
<html lang="ko">
<head>
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Shaiver</title>


    <script src="<c:url value="/resources/js/jquery-1.11.2.min.js"/>"></script>



    <style>
        html,body { height: 100%; margin: 0; padding: 0; }

        #tiles_container {
            min-height: 100%;
            position: relative;
            background: #ffd4c5 url('images/gr.jpg') 0 70px repeat-x;
        }

        #tiles_header {
            height: 100px;
            background-color: #ffc296;
        }
        #tiles_body {
            padding-bottom: 8%;
        }
        #tiles_footer {
            position: absolute;
            bottom: 0;
            width: 100%;
            height: 8%;
            background-color: #cd7e6e;
        }
    </style>

    <script type="text/javascript">


    </script>
    <tiles:insertAttribute name="headBody" ignore="true"/>
</head>

<div id="tiles_container">
    <!-- START HEADER -->
    <div id="tiles_header">


            TILES HEAD


    </div>
    <!-- END HEADER -->

<tiles:insertAttribute name="contentBody" ignore="true"/>
<body>
    <!-- START BODY -->
    <div id="tiles_body">





    </div>
    <!-- END BODY -->

    <!-- START FOOTER -->
    <div id="tiles_footer">
    <footer>
        <div class="container">
            <div align="center">
                <span class="copyright">Copyright &copy; Travailler Team</span>
            </div>
        </div>
    </footer>
    </div>
    <!-- END FOOTER -->

</body>
</div>
</html>