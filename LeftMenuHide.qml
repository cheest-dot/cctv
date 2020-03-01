import "components/ButtonImg.qml";
import "constants.js" as constants;
Item {
    id: leftMenuHide;
    
    visible: false;
    Rectangle {
        id: leftHide;

        color: constants.colors.nonActiveButton;
        width: 100;
        height: parent.height;

        Column {
            anchors.top: parent.top;
            anchors.left: parent.left;
            anchors.topMargin: 100;

            ButtonImg {
                id: cameraHide;
                text: " ";
                textInCenter: false;
                textRightOffset: 15;
                path: "apps/cctv/resources/camera";
                color: constants.colors.nonActiveButton;
                widthBtn: 100;
                defaultBtn: false;
            }
            ButtonImg {
                id: helpHide;
                text: " ";
                textInCenter: false;
                textRightOffset: 32;
                path: "apps/cctv/resources/help";
                color: constants.colors.nonActiveButton;
                widthBtn: 100;
                defaultBtn: false;
            }
            ButtonImg {
                id: exitHide;
                text: " ";
                textInCenter: false;
                textRightOffset: 32;
                path: "apps/cctv/resources/logout";
                color: constants.colors.nonActiveButton;
                widthBtn: 100;
                defaultBtn: false;
            }
        }
        Rectangle {
            id: shadow;

            anchors.top: parent.top;
            anchors.right: parent.right;

            width: 10;
            height: parent.height;

            Gradient {
                anchors.left: parent.left;
                anchors.top: parent.top;
                anchors.right: parent.right;
                anchors.bottom: parent.bottom;

                orientation: Horizontal;
                GradientStop {
                    position: 0;
                    color: constants.colors.nonActiveBackground;
                    Behavior on color { animation: Animation { duration: 300;} }
                }
                GradientStop {
                    position: 1;
                    color: constants.colors.black;
                }
		    }
		    Behavior on opacity { animation: Animation { duration: 300;} }
        }
    }
    function setColor(btn, color) {
        btn.color = color;
    }
}