import "../constants.js" as constants;

ActivePanel {
	id: simpleButton;
	property string text;
    property string path;
	property alias textColor: buttonText.color;
	property alias font: buttonText.font;
	property int textRightOffset: textInCenter ? 0 : 20;
	property bool textInCenter: true;
    property int widthBtn;
    property bool imageLeft: false;
    property int topMargin: 10;
    property string defaultColor: constants.colors.nonActiveBackground;
	height: buttonText.paintedHeight + 40;
    width: simpleButton.widthBtn;
	radius: 3;
	color: simpleButton.activeFocus 
		   		? constants.colors.activeButton 
		   		: defaultColor;

	BodyText {
		id: buttonText;
		anchors.verticalCenter: parent.verticalCenter;
		x: simpleButton.textInCenter ? (parent.width - paintedWidth) / 2 : simpleButton.textRightOffset;
		// opacity: simpleButton.enabled ? 1 : 0.5;
		color: simpleButton.activeFocus 
					? constants.colors.black 
					: constants.colors.white;
		font: bodyFont;
		text: simpleButton.text;
		focus: true;

		Behavior on color { animation: Animation { duration: 300; } }
	}
    Image {
        id: image;
        
        anchors.top: parent.top;
        anchors.left: simpleButton.imageLeft ? buttonText.left : buttonText.right;
        anchors.leftMargin: 10;
        anchors.topMargin: simpleButton.topMargin;

        source: simpleButton.activeFocus ? simpleButton.path + ".png" : simpleButton.path + "White.png";

        fillMode: PreserveAspectFit;
    }

	Behavior on color { animation: Animation { duration: 400; easingType: Linear; } }
}