/*global webkit*/

var palladium = (function () {
    "use strict";

    var palladium = {};

    palladium.plugin = function (plugin, method, params) {
        webkit.messageHandlers.callbackHandler.postMessage({
            "plugin": plugin,
            "method": method,
            "params": params
        });
    };

    return palladium;
}());
