function registerPingPort(elmApp) {

    setInterval(onTrigger, 2345)

    function onTrigger() {
        elmApp.ports.ping.send("Ping! - " + new Date());
    }
}
