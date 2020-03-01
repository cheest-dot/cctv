import "components/Button.qml";
import "components/Edit.qml";
import "constants.js" as constants;

Item {
    id: loginPage;

    signal logIn();
    signal forgetPassword();
    signal signingUp();

    signal successfulLogin();

    function loginRequest(login, password) {
        const request = new XMLHttpRequest();
        request.setRequestHeader("Content-Type", "application/json");
        request.open("POST", "http://289136-cl36333.tmweb.ru:8081/login", true);
        request.onreadystatechange = function() {
            if (request.readyState !== XMLHttpRequest.DONE)
                return;
            if (request.status === 200) {
                save("userData", JSON.parse(request.responseText));
                save("cams", JSON.parse(request.responseText)["cams"]);
                save("token", JSON.parse(request.responseText)["token"]);
                save("user_id", JSON.parse(request.responseText)["user_id"]);
                save("index", JSON.parse(request.responseText)["cams"].length);
                loginPage.successfulLogin();
            } else
                log(request.status);
        }
        let params = {
            login: login,
            password: password
        }
        request.send(JSON.stringify(params));
    }

    Rectangle {
        id: loginMenu;
        color: constants.colors.activeBackground;

        width: 375;
		height: 375;

        anchors.centerIn: parent;

        Column {
            anchors.centerIn: parent;

            spacing: 50;

            BodyText {
				anchors.centerIn: parent;
                anchors.topMargin: -340;

				text: tr("Авторизация");
			}
            BodyText {
				anchors.centerIn: parent;
                anchors.topMargin: -280;

				text: tr("Войдите, испольуя Ваш аккаунт");
			}

            Edit {
                id: loginEdit;
                anchors.centerIn: parent;
                anchors.topMargin: -150;

                hint: "Логин";

                width: 360;
                alwaysShowCursor: true;
                radius: 5;
            }

            Edit {
                id: passwordEdit;
                anchors.centerIn: parent;
                anchors.topMargin: -30;

                hint: "Пароль";
                passwordMode: true;

                width: 360;
                alwaysShowCursor: true;
                radius: 5;
            }
            Button {
                id: start;
                anchors.centerIn: parent;
                anchors.topMargin: 100;
                text: "Войти";

                btnWidth: 365;

                onSelectPressed: {
                    loginPage.logIn();
                }
            }

            BodyText {
				anchors.centerIn: parent;
                anchors.topMargin: 200;

				text: tr("или");
			}

            Button {
                id: forgotPassword;
                text: "Зарегистрироваться";

                anchors.centerIn: parent;
                anchors.topMargin: 320;

                btnWidth: 365;

                onSelectPressed: {
                    loginPage.signingUp();
                }
            }    
        }
    }
}

