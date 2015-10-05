$(document).ready(function() {

    // jQuery for page scrolling feature - requires jQuery Easing plugin
    $('a.page-scroll').bind('click', function(event) {
        var $anchor = $(this);
        $('html, body').stop().animate({
            scrollTop: ($($anchor.attr('href')).offset().top - $('.main-navigation-container').height())
        }, 1250, 'easeInOutExpo');
        event.preventDefault();
    });

    // Fit Text Plugin for Main Header
    $("h1").fitText(
        1.2, {
            minFontSize: '35px',
            maxFontSize: '65px'
        }
    );

    // Initialize WOW.js Scrolling Animations
    new WOW().init();

    // Expande/collapse for read-more
    $('.read-more').bind("click", function() {
        $('.more').slideToggle(400).removeClass("hidden");
        $(this).hide();
        return false;
    });
    $('.read-less').bind("click", function() {
        $('.more').slideToggle().addClass("hidden");
        $('.read-more').show();
        return false;
    });

});