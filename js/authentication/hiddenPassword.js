'use strict';

$(document).ready(function () {
    var $form = $('#loginF');
    var $name = $('#name');
    var $pw = $('#pw');
    var $ans = $('#ans');
    var $alert = $('#alert');

    $form.on('submit', function (e) {
        $alert.removeClass('hidden');
        $alert.removeClass('alert-danger');
        $alert.removeClass('alert-success');

        if (
            $name.val() !== 'mary' ||
            $ans.val() !== $pw.val()
        ) {
            e.stopPropagation();
            e.preventDefault();
            $alert.addClass('alert-danger');
            $alert.text('Password is not correct');
        } else {
            $alert.addClass('alert-success');
            $alert.text('Password is correct');
        }
    });
});
