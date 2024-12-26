"use strict"

$(document).ready(function(){
    var menutitle = $('li.current-page').text();
    var sitetitle = (menutitle != '') ? menutitle : $('div.x_title h2').text();
    
    NProgress.start();

    document.title = document.title + '' + sitetitle;
    
    $('.site_title i').removeClass('fa-spin');

    $('[data-toggle="tooltip"]').tooltip();
    
    $('.site_title i, .lead a i').on('mouseenter', function() {
        $(this).addClass('fa-spin');
    }).on('mouseleave', function() {
        $(this).removeClass('fa-spin');
    });
    
    if ($("input.flat")[0]) {
        $('input.flat').iCheck({
            checkboxClass: 'icheckbox_flat-green',
            radioClass: 'iradio_flat-green'
        });
    }

    NProgress.done();
});


//function getUrlParam(name) {
//    var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
//    if (results == null){
//       return null;
//    }
//    else {
//       return decodeURI(results[1]) || 0;
//    }
//}