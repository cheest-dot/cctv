import "constants.js" as constants;
import "components/Button.qml";
import "CameraCatalog.qml";

Item {
    id: deleteCamera;
    visible: false;

    signal cancel();
    signal delete();

    Rectangle {
        id: deleteCameraMenu;
        color: constants.colors.activeBackground;

        width: 550;
		height: 180;

        anchors.centerIn: parent;

        BodyText {
                id: title;
                anchors.horizontalCenter: parent.horizontalCenter;
				anchors.top: parent.top;
                anchors.topMargin: 20;

				text: tr("Вы уверены?");
		}

        Row {
            anchors.horizontalCenter: parent.horizontalCenter;
            anchors.top: title.top;
            anchors.topMargin: 60;
            spacing: 10;

            Button {
                id: deleteBtn;
                text: "Да";
                btnWidth: 175;

                onSelectPressed: {
                    deleteCamera.delete();
                }
            }

            Button {
                id: cancelBtn;
                text: "Отмена";
                btnWidth: 175;

                onSelectPressed: {
                    deleteCamera.cancel();
                }
            }
        }
    }
}