(function () {
    var appid = 'cyrpAYChM',
    conf = 'prod_f3fa5935bd472aa32cfe353c91c5727c';
    var doc = document,
    s = doc.createElement('script'),
    h = doc.getElementsByTagName('head')[0] || doc.head || doc.documentElement;
    s.type = 'text/javascript';
    s.charset = 'utf-8';
    s.src = 'http://assets.changyan.sohu.com/upload/changyan.js?conf=' + conf + '&appid=' + appid;
    h.insertBefore(s, h.firstChild);
    window.SCS_NO_IFRAME = true;
})()