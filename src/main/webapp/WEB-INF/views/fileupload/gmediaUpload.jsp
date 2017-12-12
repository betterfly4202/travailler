<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>



<tiles:insertDefinition name="defaultTemplate">
    <tiles:putAttribute name="headBody">

    <style>
        .progress {
            color:#fff;
        }
        .meter {
            width:0%;
            font-size: 12px;
            padding: .3em;
        }
    </style>

    <%--<script src="<c:url value="/resources/js/GmediaUpload.js"/>"></script>--%>
    <script>

    http://jsfiddle.net/davidchase03/n7psA/
    http://hacks.mozilla.or.kr/2011/04/resumeupload/

    window.onload  = function() {
        var bars = document.getElementById('bars'),
            uploaders = [],
            upload,
            chooseFile,
            fileName;

        upload = function (blobOrFile) {
            var formData;

            var progress = document.createElement('div'),
                meter = document.createElement('span'),
                xhr;
            progress.classList.add('progress');
            meter.classList.add('meter');
            bars.appendChild(progress);
            progress.appendChild(meter);

            xhr = new XMLHttpRequest();

            formData = null;
            formData = new xhr.FormData();
            formData.append("afile",blobOrFile);
            formData.append("fileName",fileName);

            xhr.open('POST', '<c:url value="/fileUpload"/>', true);
            xhr.setRequestHeader("chunks","chunks");

            xhr.upload.onprogress = function (e) {
                if (e.lengthComputable) {
                    meter.value = Math.round((e.loaded / e.total) * 100);
                    meter.textContent = parseFloat(meter.value) + '%';
                    meter.style.width = meter.textContent;
                }
                if (meter.textContent === '100%') progress.classList.add('success');
            };
            xhr.onloadend = function (e) {
                uploaders.pop();
                if (!uploaders.length) {
                    bars.appendChild(document.createTextNode(' All Done! '));
                }
            };
            uploaders.push(xhr);
            xhr.send(blobOrFile);
//            xhr.send(fd);
        };

        chooseFile = document.getElementById('afile');
        chooseFile.addEventListener('change', function (e) {
            var self = e.currentTarget,
                blob = self.files[0],
                BYTES_PER_CHUNK, SIZE, NUM_CHUNKS, start, end;

            fileName = blob.name;
            BYTES_PER_CHUNK = parseInt(document.getElementById('numChunks').value, 10);
            SIZE = blob.size;
            NUM_CHUNKS = Math.max(Math.ceil(SIZE / BYTES_PER_CHUNK), 1);
            bars.innerHTML = '';
            bars.innerHTML = '<p>Sending <b>' + NUM_CHUNKS + '</b> chunks:</p>';
            start = 0;
            end = BYTES_PER_CHUNK;

            while (start < SIZE) {
                upload(blob.slice(start, end));
                start = end;
                end = start + BYTES_PER_CHUNK;
            }
        }, false);
    }

    </script>

    </tiles:putAttribute>
    <tiles:putAttribute name="contentBody">
        <div class="row">
            <div class="large-12 column">
                <p>Chunk Size: 10mb (10485760 bytes)</p>
                <input type="number" min="10485760" value="10485760" id="numChunks" />
                <input type="file" id="afile" />
                <div id="done"></div>
                <div id="bars"></div>
                <button type="button" id="uploadButton">파일전송</button>
            </div>
        </div>

    </tiles:putAttribute>
</tiles:insertDefinition>