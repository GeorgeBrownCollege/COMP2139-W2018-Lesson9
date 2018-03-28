// IIFE

// Immediately Invoked Function Expression
// Anonymous self-executing function - closure

(function () {

    function Start() {
        console.log("App started...");
    }

    window.onload = Start;

})();