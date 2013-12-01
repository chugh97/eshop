var UserModel = function(data) {
    var self = this;
    self.id = ko.observable(data.id);

    self.phones = ko.observableArray(ko.utils.arrayMap(data.phones, function(phone) {
        return {
            type: phone.type,
            number: phone.number
        };
    }));

    self.addresses = ko.observableArray(ko.utils.arrayMap(data.addresses, function(address) {
        return {
            type: address.type,
            line_1: address.line_1,
            line_2: address.line_2,
            town: address.town,
            postcode: address.postcode,
            country: address.country
        };
    }));

    self.addPhone = function(phone) {
        self.phones.push({
            type: phone.type,
            number: phone.number
        });
    };

    self.removePhone = function(phone) {
        self.phones.remove(phone);
    };

    self.addAddress = function(address) {
        self.addresses.push({
            type: address.type,
            line_1: address.line_1,
            line_2: address.line_2,
            town: address.town,
            postcode: address.postcode,
            country: address.country
         });
    };

    self.removeAddress = function(address) {
        self.addresses.remove(address);
    };

    self.save = function() {
        //alert(JSON.stringify(ko.toJS(self), null, 2));
        self.lastSavedJson(JSON.stringify(ko.toJS(self), null, 2));
        $.ajax({
            url: "/user/address",
            type: "POST",
            data: JSON.stringify(ko.toJS(self), null, 2),
            dataType: "json",
            async: true,
            contentType: "application/json",
            success: function(result) {
                alert(result.output);

            },
            error: function (result) {
                alert(result.output);
            }
        })

    };

    self.lastSavedJson = ko.observable("")
};




