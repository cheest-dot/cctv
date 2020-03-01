import "Login.qml";
import "LeftMenu.qml";
import "ViewPage.qml";
import "LeftMenuHide.qml";
import "AddCamera.qml";
import "Delete.qml";
import "EditCam.qml";
import "CCTVPlayer.qml";
import "SignUp.qml";
import "ViewHelp.qml";
import "data.js" as data;

Application {
    id: appCctv;
    color: "#373E48";
    
    Login {
        id: loginPage;
        anchors.centerIn: parent;

        onLogIn: {
            loginPage.loginRequest(loginEdit.text, passwordEdit.text);
        }

        onSuccessfulLogin: {
            this.visible = false;

            appCctv.color = "#000000";

            leftMenu.visible = true;
            viewPage.visible = true;
            cameraCatalog.loadExistCameras();
            leftMenu.setFocus();
        }

        onSigningUp: {
            this.visible = false;
            signUp.visible = true;
            signUp.setFocus();
        }
    }
    SignUp {
        id: signUp;
        anchors.centerIn: parent;

        onSuccessfulSignUp: {
            this.visible = false;
            loginPage.visible = true;
            loginPage.setFocus();
        }
        onBackPressed: {
            this.visible = false;
            loginPage.visible = true;
            loginPage.setFocus();
        }
    }

    LeftMenu {
        id: leftMenu;

        opacity: activeFocus ? 1.0 : 0.5;

        anchors.left: parent.left;
        anchors.top: parent.top;
        anchors.bottom: parent.bottom;

        onExitApp: {
            viewsFinder.closeApp();
        }

        onCameraPressed: {
            this.visible = false;
            leftMenuHide.visible = true;
            viewPage.setFocus();
            leftMenuHide.setColor(cameraHide, constants.colors.choosenButton);
        }

        onHelpPressed: {
            this.visible = false;
            viewPage.visible = false;
            leftMenuHide.visible = true;
            viewHelp.visible = true;
            viewHelp.setFocus();
            leftMenuHide.setColor(helpHide, constants.colors.choosenButton);
        }
    }

    LeftMenuHide {
        id: leftMenuHide;

        // opacity: 0.5;

        anchors.left: parent.left;
        anchors.top: parent.top;
        anchors.bottom: parent.bottom;
    }

    ViewPage {
        id: viewPage;

        opacity: activeFocus ? 1.0 : 0.5;

        anchors.top: appCctv.top;
        anchors.left: activeFocus ? leftMenuHide.right : leftMenu.right;
        anchors.right: appCctv.right;
        anchors.bottom: appCctv.bottom;

        onLeftPressed: {
            leftMenuHide.setColor(cameraHide, constants.colors.nonActiveButton);
            leftMenuHide.setColor(helpHide, constants.colors.nonActiveButton);

            leftMenu.visible = true;
            leftMenuHide.visible = false;
            leftMenu.setFocus();
        }

        onAddCam: {
            addCamera.visible = true;
            addCamera.setFocus();
        }
    }
    ViewHelp {
        id: viewHelp;

        opacity: activeFocus ? 1.0 : 0.5;

        anchors.top: appCctv.top;
        anchors.left: activeFocus ? leftMenuHide.right : leftMenu.right;
        anchors.right: appCctv.right;
        anchors.bottom: appCctv.bottom;

        onLeftPressed: {
            leftMenuHide.setColor(cameraHide, constants.colors.nonActiveButton);
            leftMenuHide.setColor(helpHide, constants.colors.nonActiveButton);

            this.visible = false;
            leftMenu.visible = true;
            viewPage.visible = true;
            leftMenuHide.visible = false;
            leftMenu.setFocus();
        }
    }

    CCTVPlayer {
        id: cctvPlayer;

        anchors.fill: mainWindow;

        visible: false;

        onBackPressed: {
            cctvPlayer.abort();
            this.visible = false;
            leftMenuHide.visible = true;
            viewPage.visible = true;
            viewPage.setFocus();
        }

        onFinished: {
            cctvPlayer.hidePlayer();
        }
    }

    Delete {
        id: deleteCamera;
        anchors.centerIn: parent;

        onCancel: {
            this.visible = false;
            viewPage.setFocus();
        }
        onDelete: {
            cameraCatalog.deleteCameras();
            this.visible = false;
            viewPage.start.setFocus();
        }
    }

    EditCam {
        id: editCamera;
        anchors.centerIn: parent;

        onCancel: {
            this.visible = false;
            viewPage.setFocus();
        }
        onEditCam: {
            cameraCatalog.editCameras(nameEdit.text);
            this.visible = false;
            viewPage.setFocus();
        }
    }

    AddCamera {
        id: addCamera;
        anchors.centerIn: parent;

        onCancel: {
            this.visible = false;
            viewPage.setFocus();

        }
        onAdd: {
            addCamera.visible = false;

            viewPage.start.anchors.right = parent.right;

            cameraCatalog.visible = true;
            cameraCatalog.addCameraRequest(nameEdit.text, urlEdit.text);
            viewPage.setFocus();
        }
    }
}