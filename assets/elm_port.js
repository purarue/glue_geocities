// elm port implementation modified from https://github.com/lucamug/elm-scroll-resize-events
//  keep refrences to html variables
var _window = window;
_window.elmRef = _window.elmRef || {};
_window.elmRef.elmPortConn = (function (_window) {
  var _document = _window.document;
  var _body = _document.body;
  var _html = _document.documentElement;
  var app;

  // sends the record off to elm
  var processScrollOrResize = function () {
    app.ports.scrollOrResize.send({
      // how far we've scrolled down on the page
      scrollY: parseInt(_window.scrollY),
      // https://developer.mozilla.org/en-US/docs/Web/API/Element/clientHeight
      // When clientHeight is used on the root element (the <html> element), (or on <body> if the document is in quirks mode), the viewport's height (excluding any scrollbar) is returned.  This is a special case of clientHeight.
      viewportHeight: parseInt(_html.clientHeight),
      viewportWidth: parseInt(_html.clientWidth),
    });
  };

  var scrollTimer = null;
  var lastScrollFireTime = 0;
  var minScrollTime = 1000; // can increase this since the stars are only going to be drawn every few seconds
  var scrolledOrResized = function () {
    if (scrollTimer) {
    } else {
      var now = new Date().getTime();
      if (now - lastScrollFireTime > 3 * minScrollTime) {
        processScrollOrResize();
        lastScrollFireTime = now;
      }
      scrollTimer = setTimeout(function () {
        scrollTimer = null;
        lastScrollFireTime = new Date().getTime();
      }, minScrollTime);
    }
  };

  var main = function (initFlags) {
    app = Elm.Stars.init({
      node: document.getElementById("elm"),
      flags: initFlags,
    });
    _window.addEventListener("scroll", scrolledOrResized);
    _window.addEventListener("resize", scrolledOrResized);
    scrolledOrResized(); // initial call to send data to Elm
  };

  return {
    main: main,
  };
})(_window);
_window.elmRef.elmPortConn.main({
  starUrls: [
    "./assets/images/star1.png",
    "./assets/images/star2.png",
    "./assets/images/star3.png",
    "./assets/images/star4.png",
    "./assets/images/star5.png",
    "./assets/images/star6.png",
    "./assets/images/star7.png",
    "./assets/images/star8.png",
    "./assets/images/star9.png",
  ],
  randomNumbers: Array(100)
    .fill()
    .map(() => Math.random()),
  defaultRandom: Math.random(),
});
