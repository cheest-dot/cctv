import "components/ButtonImg.qml";
import "constants.js" as constants;
import "data.js" as data;

Item {
    id: leftMenu;

    signal exitApp();
    signal cameraPressed();
    signal helpPressed();
    
    visible: false;
    Rectangle {
        id: left;

        color: constants.colors.activeBackground;
        width: 400;
        height: parent.height;

        Column {
            anchors.top: parent.top;
            anchors.left: parent.left;
            anchors.topMargin: 100;

            ButtonImg {
                id: camera;
                text: "Видеонаблюдение";
                textInCenter: false;
                textRightOffset: 120;
                path: "apps/cctv/resources/camera";
                defaultColor: constants.colors.activeBackground;
                widthBtn: 400;
                radius: 0;

                onKeyPressed: {
                    if (key === "Select" || key === "Right") {
                        data.activeBtn = "camera";
                        leftMenu.cameraPressed();
                    }
                }
            }
            ButtonImg {
                id: help;
                text: "Помощь";
                textInCenter: false;
                textRightOffset: 250;
                path: "apps/cctv/resources/help";
                defaultColor: constants.colors.activeBackground;
                widthBtn: 400;
                radius: 0;

                onKeyPressed: {
                    if (key === "Select" || key === "Right") {
                        data.activeBtn = "help";
                        leftMenu.helpPressed();
                    }
                }
            }
            ButtonImg {
                id: exit;
                text: "Выход";
                textInCenter: false;
                textRightOffset: 270;
                path: "apps/cctv/resources/logout";
                defaultColor: constants.colors.activeBackground;
                widthBtn: 400;
                radius: 0;

                onSelectPressed: {
                    leftMenu.exitApp();
                }
            }
        }
    }
}