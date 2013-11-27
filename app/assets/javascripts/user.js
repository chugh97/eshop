$(document).ready(function () {
    var rules = {};

    $("#user_registration input.validate").each(function () {
        rules[this.id] = { required: true };
    });

    $("#user_registration").validate({
        rules: rules
    });
});