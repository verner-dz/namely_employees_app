$(document).ready(function() {
  (function(window){

    // var WORKER_PATH = 'js/recorderjs/recorderWorker.js';
    var WORKER_PATH = $('#worker-url').data('worker-url');

    var Recorder = function(source, cfg){
      var config = cfg || {};
      var bufferLen = config.bufferLen || 4096;
      this.context = source.context;
      if(!this.context.createScriptProcessor){
        this.node = this.context.createJavaScriptNode(bufferLen, 2, 2);
      } else {
        this.node = this.context.createScriptProcessor(bufferLen, 2, 2);
      }

      var worker = new Worker(config.workerPath || WORKER_PATH);
      worker.postMessage({
        command: 'init',
        config: {
          sampleRate: this.context.sampleRate
        }
      });
      var recording = false,
        currCallback;

      this.node.onaudioprocess = function(e){
        if (!recording) return;
        worker.postMessage({
          command: 'record',
          buffer: [
            e.inputBuffer.getChannelData(0),
            e.inputBuffer.getChannelData(1)
          ]
        });
      }

      this.configure = function(cfg){
        for (var prop in cfg){
          if (cfg.hasOwnProperty(prop)){
            config[prop] = cfg[prop];
          }
        }
      }

      this.record = function(){
        recording = true;
      }

      this.stop = function(){
        recording = false;
      }

      this.clear = function(){
        worker.postMessage({ command: 'clear' });
      }

      this.getBuffers = function(cb) {
        currCallback = cb || config.callback;
        worker.postMessage({ command: 'getBuffers' })
      }

      this.exportWAV = function(cb, type){
        currCallback = cb || config.callback;
        type = type || config.type || 'audio/wav';
        if (!currCallback) throw new Error('Callback not set');
        worker.postMessage({
          command: 'exportWAV',
          type: type
        });
      }

      this.exportMonoWAV = function(cb, type){
        currCallback = cb || config.callback;
        type = type || config.type || 'audio/wav';
        if (!currCallback) throw new Error('Callback not set');
        worker.postMessage({
          command: 'exportMonoWAV',
          type: type
        });
      }

      worker.onmessage = function(e){
        var blob = e.data;
        currCallback(blob);
      }

      source.connect(this.node);
      this.node.connect(this.context.destination);  // if the script node is not connected to an output the "onaudioprocess" event is not triggered in chrome.
    };



  Recorder.setupDownload = function(blob, filepath) { //mediaId
    console.log("setupDownload i was called")
      var blob = blob;
      AWS.config.update({accessKeyId: 'AKIAIH2SDUJ4334SNPYQ', secretAccessKey: '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'});
      AWS.config.region = "us-west-2";

      // instantiates an S3 connection to our notetaker bucket
      var notetaker = new AWS.S3({ params: {Bucket: "notetakeraudio"}});
      console.log(notetaker)
      // sets the permissions of the file to be public but read-only, so anyone can listen to tracks.
      var params = {ACL: "public-read", Key: filepath, ContentType: blob.type, Body: blob};

      // AWS JavaScript SDK method that sends the audio file to our notetaker S3 bucket
      notetaker.putObject(params, function(error, data) {
        // callbacks based on response from AWS
        if (error) {
          alert("Something went wrong, and we weren't able to save your track. Please try again.");
        } else {
          // persist the recording info to our server's PostgreSQL database (not S3)
          // params are :title, :url
          $.ajax({
            url: window.location.pathname.replace('/new',''),
            type: "POST",
            data: {sound: {title: filepath, url:"https://notetakeraudio.s3-us-west-2.amazonaws.com/" + filepath }},
            dataType: "json",
            // server response error callback function
            error: function() {
              alert("record was so bad, it could not persist in our DB");
            },
            // server response success callback function
            success: function(data){
              console.log(data);
              dataHash = {
                sound_id: data.id,
                noteArray: submitTagArray,
              }

              $.ajax({
                url: '/sounds/' + data.id + '/note_tags',
                method: "POST",
                data: dataHash,
                dataType: "json"
              }).always(function() {
                window.location = '/sounds/' + data.id;
              })




              // for(var i = 0; i < submitTagArray.length; i++){
              //  var NoteTagSoundId = submitTagArray[i].sound_id = data.sound_id
              //  var NoteTagUserId = submitTagArray[i].user_id = data.user_id
              // },
              // // send an ajax request to persist note_tags to it's db
              //  $.ajax({
              //    url:  '/sounds/'+:sound_id+'/note_tags', //how to write this url?
              //    type: "POST",
              //    data: {note_tag: {content: inputText, created_epoch: noteCreationEpoch, sound_id: TagSoundId, user_id: NotetagUserId }}
              //    dataType: "json"
              //  }) //.done({
              // window.location.replace("/sounds"); //+ mediaId redirect to new page that playbacks audio
              // })
            }
          });
        }
      });
    }


      // Recorder.setupDownload = function(blob, filename){
      //  var url = (window.URL || window.webkitURL).createObjectURL(blob);
      //  var link = document.getElementById("save");
      //  link.href = url;
      //  link.download = filename || 'output.wav';
      // }

    window.Recorder = Recorder;

  })(window);
});
