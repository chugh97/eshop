/**
 * Created with JetBrains RubyMine.
 * User: shaleenchugh
 * Date: 22/11/13
 * Time: 22:24
 * To change this template use File | Settings | File Templates.
 */
$(document).ready(function () {
    $.ajax({
        url: "/carts/show",
        async: true,
        contentType: "application/json",
        success: function(data) {
            var rows = data;
            if (rows && rows !== undefined){
                $('#shopping_cart').append('<tr><td>Product name</td><td>quantity</td><td>Price</td></tr>');
                for (var i=0;i< rows.length;i++){
                    $('#shopping_cart').append('<tr><td>'+ rows[i].product_id +'</td><td>'+ rows[i].quantity +'</td><td>£'+ rows[i].unit_price +'</td></tr>');
                }
            }
        }
    })
});