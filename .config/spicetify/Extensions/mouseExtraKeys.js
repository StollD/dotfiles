//@ts-check

// NAME: Mouse Extra Keys
// AUTHOR: Dorian Stoll
// DESCRIPTION: Register BTN_SIDE and BTN_EXTRA as back and forward

/// <reference path="../globals.d.ts" />

(function MouseExtraKeys() {
    if (!Spicetify.Keyboard) {
        setTimeout(MouseExtraKeys, 1000);
        return;
    }

    console.log("hi!");

    registerBind(0xA6, false, false, false, clickNavigatingBackButton);
    registerBind(0xA7, false, false, false, clickNavigatingForwardButton);

    function clickNavigatingBackButton() {
        document.querySelector("#header .back").click();
    }

    function clickNavigatingForwardButton() {
        document.querySelector("#header .forward").click();
    }

    /**
     * 
     * @param {string | number} keyName 
     * @param {boolean} ctrl 
     * @param {boolean} shift 
     * @param {boolean} alt 
     * @param {(event: KeyboardEvent) => void} callback 
     */
    function registerBind(keyName, ctrl, shift, alt, callback) {
        if (typeof keyName === "string") {
            keyName = Spicetify.Keyboard.KEYS[keyName];
        }

        Spicetify.Keyboard.registerShortcut(
            {
                key: keyName,
                ctrl,
                shift,
                alt,
            },
            callback,
        );
    }
})();
