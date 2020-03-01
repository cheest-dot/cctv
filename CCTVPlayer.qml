import controls.Player;

Player {
    id: cctvPlayer;

    focus: true;

    isFullscreen: true;

    function playVideoById(url) {
        cctvPlayer.abort();
        cctvPlayer.playUrl(url);
        cctvPlayer.setFocus();
    }
}