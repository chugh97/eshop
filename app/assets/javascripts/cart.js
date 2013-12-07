/**
 * Created with JetBrains RubyMine.
 * User: shaleenchugh
 * Date: 22/11/13
 * Time: 22:24
 * To change this template use File | Settings | File Templates.
 */
function formatCurrency(value) {
    return "£" + value.toFixed(2);
}


$(document).ready(function () {

    var CartModel = function(lineitems) {
        var self = this;

        for(var i=0;i<lineitems.length;i++){
            lineitems[i].sub_total = lineitems[i].unit_price * lineitems[i].quantity
        }

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

        self.grandTotal = ko.computed(function() {
            var total = 0;
            $.each(self.lineitems(), function() { total += this.sub_total })
            return total;
        });
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