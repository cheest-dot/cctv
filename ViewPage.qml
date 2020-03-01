import "components/Button.qml";
import "constants.js" as constants;
import "CameraCatalog.qml";
import "CameraDelegate.qml";
// import "AddCamera.qml";

Item {
    id: viewPage;
    visible: false;

    signal addCam();

    Rectangle {
        id: right;

        anchors.top: viewPage.top;
        anchors.right: viewPage.right;

        opacity: addCamera.activeFocus ? 0.5 : 1;

        focus: true;

        color: viewPage.activeFocus
                ? constants.colors.activeBackground 
                : constants.colors.nonActiveBackground;

        width: leftMenu.activeFocus ? appCctv.width - 400 : appCctv.width - 100;
        height: parent.height;

        Rectangle {
            id: shadow;

            anchors.top: parent.top;
            anchors.left: parent.left;

            visible: leftMenu.activeFocus ? true : false;

            opacity: 0.5;

            width: 50;
            height: parent.height;

            Gradient {
                anchors.left: parent.left;
                anchors.top: parent.top;
                anchors.right: parent.right;
                anchors.bottom: parent.bottom;

                orientation: Horizontal;
                GradientStop {
                    position: 0;
                    color: constants.colors.black;
                    Behavior on color { animation: Animation { duration: 300;} }
                }
                GradientStop {
                    position: 1;
                    color: constants.colors.nonActiveBackground;
                }
		    }
		    Behavior on opacity { animation: Animation { duration: 300;} }
        }

        Button {
            id: start;
            text: "Добавить";
            // anchors.horizontalCenter: parent.horizontalCenter;
            anchors.top: parent.top;
            anchors.left: parent.left;
            anchors.right: parent.right;
            anchors.topMargin: 50;
            btnWidth: parent.width;
            radius: 5;

            onSelectPressed: {
				viewPage.addCam();
			}
			onDownPressed: {
                cameraCatalog.setFocus();
            }
        }
        CameraCatalog {
            id: cameraCatalog;

            anchors.top: start.bottom;
            anchors.left: parent.left;
            anchors.right: parent.right;
            anchors.bottom: parent.bottom;
            anchors.topMargin: 50;
            anchors.leftMargin: viewPage.activeFocus ? 80 : 200;

            keyNavigationWraps: false;

            onUpPressed: {
                start.setFocus();
            }
        }
    }
}