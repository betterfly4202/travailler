/**
 * Created by betterFLY on 2017-12-12.
 */
(function () {
    'use strict';
    var bars = document.getElementById('bars'),
        uploaders = [],
        upload,
        chooseFile;

    upload = function (blobOrFile) {
        var progress = document.createElement('div'),
            meter = document.createElement('span'),
            xhr;
        progress.classList.add('progress');
        meter.classList.add('meter');
        bars.appendChild(progress);
        progress.appendChild(meter);

        xhr = new XMLHttpRequest();
        xhr.open('POST', '/echo/json/', true);
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
    };
    chooseFile = document.getElementById('afile');
    chooseFile.addEventListener('change', function (e) {
        var self = e.currentTarget,
            blob = self.files[0],
            BYTES_PER_CHUNK, SIZE, NUM_CHUNKS, start, end;

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
})();