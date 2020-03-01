import "constants.js" as constants;
import controls.Edit;
import "components/Button.qml";
import "CameraCatalog.qml";

Item {
    id: editCamera;
    visible: false;

    signal cancel();
    signal editCam();

    Rectangle {
        id: editCameraMenu;
        color: constants.colors.activeBackground;

        width: 550;
		height: 230;

        anchors.centerIn: parent;

        BodyText {
                id: title;
                anchors.horizontalCenter: parent.horizontalCenter;
				anchors.top: parent.top;
                anchors.topMargin: 20;

				text: tr("Редактировать камеру");
		}

		Column {
            anchors.horizontalCenter: parent.horizontalCenter;

            Edit {
                id: nameEdit;
                anchors.horizontalCenter: parent.horizontalCenter;
                anchors.top: title.top;
                anchors.topMargin: 50;

                width: 360;
                alwaysShowCursor: true;
                radius: 5;
            }

            Row {
                anchors.horizontalCenter: parent.horizontalCenter;
                anchors.top: nameEdit.top;
                anchors.topMargin: 60;
                spacing: 10;

                Button {
                    id: okBtn;
                    text: "Ok";
                    btnWidth: 175;

                    onSelectPressed: {
                        editCamera.editCam();
			        }
                }

                Button {
                    id: cancelBtn;
                    text: "Отмена";
                    btnWidth: 175;

                    onSelectPressed: {
                        editCamera.cancel();
			        }
                }
            }
        }
    }
}