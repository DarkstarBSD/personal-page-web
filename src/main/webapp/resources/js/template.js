(function ($) {
    $(window).on("load", function () {
        <!-- mCustomScrollbar init -->
        $(".main-area").mCustomScrollbar({
            callbacks: {
                onScrollStart: function () {
                    $(".mCSB_dragger_bar").css("background", "#292b2d");
                },
                onScroll: function () {
                    $(".mCSB_dragger_bar").css("background", "#5a5a5a");
                }
            }
        });
        $(".mCSB_dragger").hover(
            function () {
                $(".mCSB_dragger_bar").css("background", "#292b2d");
            },
            function () {
                $(".mCSB_dragger_bar").css("background", "#5a5a5a");
            });


    });
})(jQuery);