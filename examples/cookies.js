var page = require('webpage').create();

page.settings.resourceTimeout = 5000; // 5 secs
page.settings.userAgent = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36';

page.open('https://soysuper.com', function(status) {
    if (status !== "success") {
        console.log("Request failed with status: " + status);
        phantom.exit();
    }
    else {
      get_cookies(page);
    }
});

function get_cookies(page) {
  if ( page.cookies.length ) {
    console.log( JSON.stringify( page.cookies ) );
    phantom.exit();
  }
  else {
    setInterval(function() { get_cookies(page) }, 5);
  }
}
