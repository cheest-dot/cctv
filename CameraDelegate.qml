import "components/ButtonImg.qml";
import "constants.js" as constants;
import "data.js" as data;

Item {
    id: deligate;
    color: activeFocus ? constants.colors.activeBackground : constants.colors.nonActiveButton;
    opacity: activeFocus ? 1 : 0.9;


    Rectangle {
        id: cameraDelegate;
        color: constants.colors.activeBackground;

        width: 450;
        height: 330;

        focus: true;

        Rectangle {
            id: topText;

            color: constants.colors.activeBackground;

            anchors.top: cameraDelegate.top;
            anchors.bottom: posterDefaultImage.top;

            width: 450;
            height: 35;

            visible: true;

            focus: false;

            BodyText {
                anchors.horizontalCenter: parent.horizontalCenter;
                anchors.top: parent.top;

                text: model.name;
            }

        }

        Image {
            id: posterDefaultImage;

            anchors.top: topText.bottom;
            anchors.bottom: cameraDelegate.bottom;

            width:  deligate.activeFocus ? cameraDelegate.width + 20  : cameraDelegate.width;
		    height: deligate.activeFocus ? cameraDelegate.height + 20  : cameraDelegate.height;

            source: model.screenshot;

            fillMode: PreserveAspectFit;

            Behavior on width  { animation: Animation { duration: 150; } }
            Behavior on height { animation: Animation { duration: 150; } }
        }
        Rectangle {
            id: btns;

            color: constants.colors.activeBackground;

            anchors.top: cameraDelegate.bottom;
            anchors.topMargin: 10;

            width: 450;
            height: 65;

            visible: cameraDelegate.activeFocus ? true : false;

            focus: false;

            Row {
                anchors.bottom: parent.bottom;
                anchors.left: parent.left;
                anchors.bottomMargin: 5;
                anchors.leftMargin: 3;
                spacing: 5;

                ButtonImg {
                    id: start;
                    text: "Открыть";
                    textInCenter: false;
                    textRightOffset: 5;
                    topMargin: 25;
                    path: "apps/cctv/resources/open";
                    widthBtn: 145;
                    radius: 5;

                    onSelectPressed: {
                        leftMenuHide.visible = false;
                        viewPage.visible = false;
                        cctvPlayer.visible = true;
                        cctvPlayer.playVideoById(model.url);
                    }
                }

                ButtonImg {
                    id: change;
                    text: "Изменить";
                    textInCenter: false;
                    textRightOffset: 5;
                    topMargin: 25;
                    path: "apps/cctv/resources/edit";
                    widthBtn: 155;
                    radius: 5;

                    onSelectPressed: {
                        data.nameOfDeletedCam = model.name;
                        data.oldNameOfCam = model.name;
                        data.cam_id = model.cam_id;
                        editCamera.visible = true;
                        editCamera.setFocus();
                    }
                }

                ButtonImg {
                    id: delete;
                    text: "Удалить";
                    textInCenter: false;
                    textRightOffset: 18;
                    topMargin: 25;
                    path: "apps/cctv/resources/delete";
                    widthBtn: 155;
                    radius: 5;

                    onSelectPressed: {
                       data.cam_id = model.cam_id;
                       data.nameOfDeletedCam = model.name;
                       deleteCamera.visible = true;
                       deleteCamera.setFocus();
                    }
                }
            }
        }
    }
}
