import "components/Button.qml";
import "constants.js" as constants;
import "CameraCatalog.qml";
import "CameraDelegate.qml";
// import "AddCamera.qml";

Item {
    id: viewHelp;
    visible: false;

    signal addCam();

    Rectangle {
        id: right;

        anchors.top: viewHelp.top;
        anchors.right: viewHelp.right;

        // opacity: addCamera.activeFocus ? 0.5 : 1;

        focus: true;

        /*color: viewHelp.activeFocus
                ? constants.colors.activeBackground
                : constants.colors.nonActiveBackground;*/

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
        Rectangle {
            id: menu;

            anchors.top: parent.top;
            anchors.left: parent.left;

            visible: viewHelp.activeFocus ? true : false;

            color: constants.colors.activeBackground;

            width: 400;
            height: parent.height;

            Column {
                anchors.top: parent.top;
                anchors.left: parent.left;
                anchors.topMargin: 100;

                Button {
                    id: techCont;
                    text: "Контакты технической поддержки";
                    btnWidth: 400;
                    radius: 0;
                    defaultColor: constants.colors.activeBackground;

                    onKeyPressed: {
                        if (key === "Select" || key === "Right") {
                        }
                    }
                }
                Button {
                    id: appInfo;
                    text: "Информация о приложении";
                    btnWidth: 400;
                    radius: 0;
                    defaultColor: constants.colors.activeBackground;

                    onKeyPressed: {
                        if (key === "Select" || key === "Right") {
                        }
                    }
                }
            }
        }
        Rectangle {
            id: shadow2;

            anchors.top: parent.top;
            anchors.right: menu.right;

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

        Rectangle {
            id: descriptionContact;

            anchors.top: parent.top;
            anchors.left: menu.right;

            visible: true;

            color: constants.colors.nonActiveBackground;

            width: 700;
            height: parent.height;

            BodyText {
                visible: techCont.activeFocus ? true : false;
				anchors.top: parent.top;
				anchors.left: menu.right;
                anchors.topMargin: 70;
                anchors.leftMargin: 20;

				text: "Если Вы хотите непосредственно связяться с \nразработчиками или оставить жалобу, Вы можете отправить \nписьмо на электронную почту: ssnfree1@gmail.com";
			}
			BodyText {
                visible: appInfo.activeFocus ? true : false;
				anchors.top: parent.top;
				anchors.left: menu.right;
                anchors.topMargin: 70;
                anchors.leftMargin: 20;

				text: "Версия приложения: 1.0.0";
			}
        }
    }
}