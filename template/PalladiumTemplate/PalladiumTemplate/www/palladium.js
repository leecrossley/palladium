/*global webkit*/

var palladium = (function () {
    "use strict";

    var palladium = {};

    palladium.plugin = function (plugin, params) {
        webkit.messageHandlers.callbackHandler.postMessage({
            "plugin": plugin,
            "params": params
        });
    };

    return palladium;
}());
