<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>



<tiles:insertDefinition name="defaultTemplate">
    <tiles:putAttribute name="headBody">
        <style type="text/css">
            .tg  {border-collapse:collapse;border-spacing:0;}
            .tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;}
            .tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;}
            .tg .tg-lqy6{text-align:right;vertical-align:top}
            .tg .tg-yw4l{vertical-align:top}
        </style>


        <script>
            $(function(){

            });


            var dropFile = function(event){
                event.preventDefault();
            }
        </script>

    </tiles:putAttribute>
    <tiles:putAttribute name="contentBody">
        <button type="button" onclick="history.back()">이전</button> <br/>

        <%--<form action="" method="post" enctype="multipart/form-data">--%>
            <%--<table class="tg">--%>
                <%--<tr>--%>
                    <%--<td class="tg-yw4l">태그</td>--%>
                    <%--<td class="tg-yw4l">--%>
                    <%--</td>--%>
                <%--</tr>--%>
                <%--<tr>--%>
                    <%--<td class="tg-yw4l">파일 업로드</td>--%>
                    <%--<td class="tg-yw4l">--%>
                        <%--<input multiple="multiple" type="file" name="filename[]"/>--%>
                    <%--</td>--%>
                <%--</tr>--%>
            <%--</table>--%>
        <%--</form>--%>

        <%--<div onchange="dropfile();"></div>--%>


        <input type="file" id="files" name="files[]" multiple />
        <output id="list"></output>

        <script>
            function handleFileSelect(evt){
                var files = evt.target.files;
                var output = [];

                for(var i=0,f; f=files[i]; i++){
                    output.push('<li><strong>', escape(f.name),'</strong>(',f.type || 'n/a',') -',
                                f.size,'bytes, last modified : ',
                                f.lastModifiedDate ? f.lastModifiedDate.toLocaleDateString(): 'n/a',
                                '</li>');

                }
                document.getElementById('list').innerHTML = '<ul>' + output.join('') + '</ul>';
            }

            document.getElementById('files').addEventListener('change', handleFileSelect, false);


            function handleDragOver(evt){
                evt.stopPropagation();
                evt.preventDefault();
                evt.dataTransfer.dropEffect = 'copy';
            }

            var dropZone = document.getElementById('drop_zone');
            dropZone.addEventListener('dragover', handleDragOver, false);
            dropZone.addEventListener('drop', handleFileSelect, false);
        </script>

        // 참고 사이트
        http://dimdim.tistory.com/entry/HTML5-%EC%99%80-JQuery-%EB%A5%BC-%EC%82%AC%EC%9A%A9%ED%95%9C-%EB%8C%80%EC%9A%A9%EB%9F%89-%ED%8C%8C%EC%9D%BC-%EC%97%85%EB%A1%9C%EB%93%9C-%EA%B8%B0%EB%8A%A5-%EA%B5%AC%ED%98%84
        http://webisfree.com/2015-10-01/[html5]-%ED%8C%8C%EC%9D%BC-%EC%97%85%EB%A1%9C%EB%93%9C%EC%8B%9C-%EB%8B%A4%EC%A4%91-%EC%84%A0%ED%83%9D-%EB%B0%8F-%EB%93%9C%EB%9E%98%EA%B7%B8-%EC%9D%B4%EB%8F%99-%EB%B0%A9%EB%B2%95
        https://m.blog.naver.com/PostView.nhn?blogId=deepsoft1&logNo=10161312260&proxyReferer=https%3A%2F%2Fwww.google.co.kr%2F

    </tiles:putAttribute>
</tiles:insertDefinition>