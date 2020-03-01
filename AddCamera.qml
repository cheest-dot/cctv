import "constants.js" as constants;
import controls.Edit;
import "components/Button.qml";
import "CameraCatalog.qml";

Item {
    id: addCamera;
    visible: false;

    signal cancel();
    signal add();

    Rectangle {
        id: addCameraMenu;
        color: constants.colors.activeBackground;

        width: 550;
		height: 300;

        anchors.centerIn: parent;

        BodyText {
                id: title;
                anchors.horizontalCenter: parent.horizontalCenter;
				anchors.top: parent.top;
                anchors.topMargin: 20;

				text: tr("Добавить камеру");
		}

		Column {
            anchors.horizontalCenter: parent.horizontalCenter;

            Edit {
                id: nameEdit;
                anchors.horizontalCenter: parent.horizontalCenter;
                anchors.top: title.top;
                anchors.topMargin: 50;

                hint: "Название камеры";


                width: 360;
                alwaysShowCursor: true;
                radius: 5;
            }

            Edit {
                id: urlEdit;
                anchors.horizontalCenter: parent.horizontalCenter;
                anchors.top: nameEdit.top;
                anchors.topMargin: 50;

                hint: "Ссылка на RTSP поток";

                width: 360;
                alwaysShowCursor: true;
                radius: 5;
            }

            Row {
                anchors.horizontalCenter: parent.horizontalCenter;
                anchors.top: urlEdit.top;
                anchors.topMargin: 60;
                spacing: 10;

                Button {
                    id: okBtn;
                    text: "Ok";
                    btnWidth: 175;

                    onSelectPressed: {
                        addCamera.add();
			        }
                }

                Button {
                    id: cancelBtn;
                    text: "Отмена";
                    btnWidth: 175;

                    onSelectPressed: {
                        addCamera.cancel();
			        }
                }
            }
        }
    }
}