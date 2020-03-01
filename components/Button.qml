import "../constants.js" as constants;
ActivePanel {
	id: simpleButton;
	property string text;
	property alias textColor: buttonText.color;
	property alias font: buttonText.font;
	property int textRightOffset: textInCenter ? 0 : 20;
	property bool textInCenter: true;
	property int btnWidth: buttonText.width + 30;
	property string defaultColor: constants.colors.nonActiveBackground;
	height: buttonText.paintedHeight + 30;
	width: Math.max(140, btnWidth);
	radius: 5;
	color: simpleButton.activeFocus 
		   		? constants.colors.activeButton
		   		: defaultColor;

	BodyText {
		id: buttonText;
		anchors.verticalCenter: parent.verticalCenter;
		x: simpleButton.textInCenter ? (parent.width - paintedWidth) / 2 : simpleButton.textRightOffset;
		opacity: simpleButton.enabled ? 1 : 0.4;
		color: simpleButton.activeFocus ? constants.colors.white : colorTheme.activeTextColor;
		font: bodyFont;
		text: simpleButton.text;
		focus: true;

		Behavior on color { animation: Animation { duration: 300; } }
	}

	Behavior on color { animation: Animation { duration: 400; easingType: Linear; } }
}