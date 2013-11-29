/**
 * Created with JetBrains RubyMine.
 * User: shaleenchugh
 * Date: 22/11/13
 * Time: 22:24
 * To change this template use File | Settings | File Templates.
 */
$(document).ready(function () {

    var LineItem = function(item){
        var self = this;
        self.product_id = item.product_id;
        self.quantity = item.quantity;
        self.unit_price = item.unit_price;
    };

    var CartModel = function(lineitems) {
        var self = this;
        self.lineitems = ko.observableArray(lineitems);

        self.addAddLineItem = function(lineitem) {
            self.lineitems.push({
                product_id: lineitem.product_id,
                quantity: lineitem.quantity,
                unit_price: lineitem.unit_price
            });
        };

        self.removeLineItem = function(lineitem) {
            self.lineitems.remove(lineitem);
            $.ajax({
                url: "/carts/deletelineitem",
                type: "POST",
                data: JSON.stringify(lineitem.product_id),
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
    };

    if ($("#cart").length){
        $.ajax({
            url: "/carts/show",
            async: true,
            contentType: "application/json",
            success: function(data) {
                var rows = data;
                if (rows && rows !== undefined){
                    var viewModel = new CartModel(rows);
                    ko.applyBindings(viewModel, document.getElementById('cart'));
                }
            }
        });
    }
});