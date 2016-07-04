(function ($) {
    $(window).on("load", function () {
        <!-- mCustomScrollbar init -->
        $(".scrollbar-container").mCustomScrollbar({
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

        <!-- Send by e-mail form -->
        $('#sbmSubmit').on('click', function () {
            if (sendByEmailFormValidate) {
                var valuesToSubmit = $("#sendByMailForm").serialize();
                $("#sendByMailModal").modal('hide');

                $.ajax({
                    url: "email",
                    data: valuesToSubmit,
                    type: "POST",
                    success: function () {
                        successSticker('Mail with CV has been sent successfully');
                    },
                    error: function () {
                        failSticker('Error sending CV', false);
                    }
                })
            }
            return false;
        });

        $('#sendByMailForm').find('input').on('change  paste keyup', sendByEmailFormValidate);
    });

    function isEmail(email) {
        var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
        return regex.test(email);
    }

    function sendByEmailFormValidate() {
        var sbmEmailContainer = $('#sbmEmailContainer');
        var sbmFormatContainer = $('#sbmFormatContainer');
        var submit = $('#sbmSubmit');

        var formatSelected = $('#sbmPdf').is(':checked') || $('#sbmDoc').is(':checked');
        var isEmailValid = isEmail($('#sbmEmail').val());

        if (isEmailValid) {
            sbmEmailContainer.addClass('has-success');
            sbmEmailContainer.removeClass('has-error');
        } else {
            sbmEmailContainer.addClass('has-error');
            sbmEmailContainer.removeClass('has-success');
        }

        var sbmFormatAlert = $('#sbmFormatAlert');
        if (formatSelected) {
            sbmFormatAlert.hide();
        } else {
            sbmFormatAlert.show();
        }

        if (isEmailValid && formatSelected) {
            submit.prop('disabled', false);
        } else {
            submit.prop('disabled', true);
        }
        return formatSelected && isEmailValid;
    }

    function successSticker(message) {
        $.stickr({
            note: message,
            className: 'success-sticker',
            position: {left: 5, top: 55},
            time:3000,
            speed:2000
        });
    }

    function failSticker(message){
        $.stickr({
            note: message,
            className: 'fail-sticker',
            position: {left: 5, top: 55},
            time:3000,
            speed:2000,
            sticked:true
        });
    }
})(jQuery);

