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

    <title>The Travailler's Home</title>

    <script type="text/javascript">


    </script>
    <tiles:insertAttribute name="headBody" ignore="true"/>
</head>

    <tiles:insertAttribute name="contentBody" ignore="true"/>
<body>


<div>
    TILES BODY
</div>











<!-- START FOOTER -->
    <!-- Footer -->
    <footer>
        <div class="container">
            <div align="center">
                <span class="copyright">Copyright &copy; Travailler Team</span>
            </div>
        </div>
    </footer>
<!-- END FOOTER -->
</body>
</html>