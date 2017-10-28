<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<tiles:insertDefinition name="defaultTemplate">
    <tiles:putAttribute name="headBody">

<script>
    $(function(){

    });

    function fn_show(){
        if($("#address").show()){
            $("#address").hide();
        }else{
            $("#address").show();
        }
    }

</script>

</tiles:putAttribute>
<tiles:putAttribute name="contentBody">

hihi

    </tiles:putAttribute>
</tiles:insertDefinition>