import "components/Button.qml";
import "components/Edit.qml";
import "constants.js" as constants;

Item {
    id: signUpPage;
    visible : false;

    signal successfulSignUp();

    function signUpRequest(login, password) {
        const request = new XMLHttpRequest();
        request.setRequestHeader("Content-Type", "application/json");
        request.open("POST", "http://289136-cl36333.tmweb.ru:8081/signup", true);
        request.onreadystatechange = function() {
            if (request.readyState !== XMLHttpRequest.DONE)
                return;
            if (request.status === 200) {
                signUpPage.successfulSignUp();
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
        id: signUpMenu;
        color: constants.colors.activeBackground;

        width: 375;
		height: 375;

        anchors.centerIn: parent;

        Column {
            anchors.centerIn: parent;

            spacing: 50;

            BodyText {
				anchors.centerIn: parent;
                anchors.topMargin: -240;

				text: tr("Регистрация");
			}

            Edit {
                id: signUploginEdit;
                anchors.centerIn: parent;
                anchors.topMargin: -150;

                hint: "Логин";

                width: 360;
                alwaysShowCursor: true;
                radius: 5;
            }

            Edit {
                id: signUppasswordEdit;
                anchors.centerIn: parent;
                anchors.topMargin: -30;

                hint: "Пароль";
                passwordMode: true;

                width: 360;
                alwaysShowCursor: true;
                radius: 5;
            }
            Button {
                id: forgotPassword;
                text: "Зарегистрироваться";

                anchors.centerIn: parent;
                anchors.topMargin: 100;

                btnWidth: 365;

                onSelectPressed: {
                    signUpPage.signUpRequest(signUploginEdit.text, signUppasswordEdit.text);
                }
            }
        }
    }
}

