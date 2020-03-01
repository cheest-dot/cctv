import "CameraDelegate.qml";
import "data.js" as data;

GridView {
    id: cameraListView;

    property bool loading: false;

    visible: !loading;

    cellWidth: 500;
    cellHeight: 440;

    focus: true;
    clip: true;

    delegate: CameraDelegate {}
    model: ListModel { id: cameraListModel; }

    function editRequest(cam_id, name, index, url) {
        const request = new XMLHttpRequest();
        request.setRequestHeader("Content-Type", "application/json");
        request.setRequestHeader("Authorization", "Bearer " + load("token"));
        request.open("PUT", "http://289136-cl36333.tmweb.ru:8081/cams/edit", true);
        request.onreadystatechange = function() {
            if (request.readyState !== XMLHttpRequest.DONE)
                return;
            if (request.status === 200) {
                cameraListModel.remove(index, 1)
                delete data.db[name];

                let i = 0;
                if (data.db !== ""){
                    for (let name in data.db) {
                        data.db[name].index = i;
                        i++;
                    }
                }
                data.index = i;
                cameraListView.loadCameras(name, url, cam_id);
            } else
                log(request.status);
        }
        let params = {
            cam_id: cam_id,
            name: name
        }
        request.send(JSON.stringify(params));
    }

    function deleteRequest(index, cam_id, name) {
        const request = new XMLHttpRequest();
        request.setRequestHeader("Content-Type", "application/json");
        request.setRequestHeader("Authorization", "Bearer " + load("token"));
        request.open("DELETE", "http://289136-cl36333.tmweb.ru:8081/cams/delete", true);
        request.onreadystatechange = function() {
            if (request.readyState !== XMLHttpRequest.DONE)
                return;
            if (request.status === 200) {
                cameraListModel.remove(index, 1)
                delete data.db[name];

                let i = 0;
                if (data.db !== ""){
                    for (let name in data.db) {
                        data.db[name].index = i;
                        i++;
                    }
                }
                data.index = i;
            } else
                log(request.status);
        }
        let params = {
            cam_id: cam_id
        }
        request.send(JSON.stringify(params));
    }

    function addCameraRequest(name, url) {
        const request = new XMLHttpRequest();
        request.setRequestHeader("Content-Type", "application/json");
        request.setRequestHeader("Authorization", "Bearer " + load("token"));
        request.open("POST", "http://289136-cl36333.tmweb.ru:8081/cams/add", false);
        request.onreadystatechange = function() {
            if (request.readyState !== XMLHttpRequest.DONE)
                return;
            if (request.status === 200) {
                cameraListView.loadCameras(name, JSON.parse(request.responseText)["hls"], JSON.parse(request.responseText)["cam_id"]);
            } else
                log(request.status);
        }
        let params = {
            user_id: load("user_id"),
            rtsp: url,
            name: name
        }
        request.send(JSON.stringify(params));
    }

    function loadExistCameras() {
        const cams = load("cams");

        cams.forEach(function(item){
          log(item.screenshot);
          cameraListModel.append({  name: item.name, url: item.hls, index: data.index, cam_id: item.cam_id, screenshot: item.screenshot });
          data.db[item.name] = {
            url: item.hls,
            index: data.index,
            cam_id: item.cam_id,
            screenshot: item.screenshot
          }
          data.index++;
        });
        cameraListView.setFocus();
    }

    function loadCameras(name, url, cam_id) {
        cameraListView.loading = true;

        cameraListModel.append({  name: name, url: url, index: data.index, cam_id: cam_id });

        data.db[name] = {
            url: url,
            index: data.index,
            cam_id: cam_id
        }

        data.index++;

        cameraListView.loading = false;
        cameraListView.setFocus();
    }

    function deleteCameras() {
        for (let name in data.db) {
            if (data.db[name].cam_id === data.cam_id) {
                cameraListView.deleteRequest(data.db[name].index, data.db[name].cam_id, name);
            }
        }
    }

    function editCameras(newName) {
        for (let name in data.db) {
            if (data.db[name].cam_id === data.cam_id) {
                cameraListView.editRequest(data.db[name].cam_id, newName, data.db[name].index, data.db[name].url);
            }
        }
    }
}