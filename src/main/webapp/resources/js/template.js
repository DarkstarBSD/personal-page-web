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
            var valuesToSubmit = $("#sendByMailForm").serialize();
            $("#sendByMailModal").modal('hide');

            $.ajax({
                url: "email",
                data: valuesToSubmit,
                type: "POST",
                success: function (data) {
                    successSticker(data);
                },
                error: function (data) {
                    failSticker(data.responseJSON);
                }
            });
            return false;
        });

        <!-- Send message form -->
        $('#smSubmit').on('click', function () {
            var valuesToSubmit = $("#sendMessageForm").serialize();
            $("#sendMessageModal").modal('hide');
            $.ajax({
                url: "messageMe",
                data: valuesToSubmit,
                type: "POST",
                success: function (data) {
                    successSticker(data);
                },
                error: function (data) {
                    failSticker(data.responseJSON);
                }
            });
            return false;
        });

        $('#sendByMailForm').find('input').on('change  paste keyup', sendByEmailFormValidate);
        $('#sendMessageForm').find('#smName').on('change  paste keyup', sendMessageFormValidate);
    });

    function isEmail(email) {
        var regex = /.+@.+\..+/i;
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

    function sendMessageFormValidate() {
        var smNameContainer = $('#smNameContainer');
        var submit = $('#smSubmit');

        if (smNameContainer.find("#smName").val().length > 0) {
            smNameContainer.addClass('has-success');
            smNameContainer.removeClass('has-error');
            submit.prop('disabled', false);
            return true;
        } else {
            smNameContainer.addClass('has-error');
            smNameContainer.removeClass('has-success');
            submit.prop('disabled', true);
            return false;
        }
    }

    function successSticker(message) {
        $.stickr({
            note: message,
            className: 'success-sticker',
            position: {left: 0, top: 50},
            time: 3000,
            speed: 2000
        });
    }

    function failSticker(message) {
        $.stickr({
            note: message,
            className: 'fail-sticker',
            position: {left: 0, top: 50},
            time: 3000,
            speed: 2000,
            sticked: true
        });
    }
})(jQuery);

