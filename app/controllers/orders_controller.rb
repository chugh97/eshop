class OrdersController < ApplicationController
  def express
    total = Cart.total(session[:session_id])
    items = Cart.items_in_cart(session[:session_id])
    response = EXPRESS_GATEWAY.setup_purchase(total * 100,
                                              :ip                => request.remote_ip,
                                              :return_url        => orders_new_url,
                                              :cancel_return_url => products_url,
                                              currency: 'GBP',
                                              locale: I18n.locale.to_s.sub(/-/, '_'), #you can put 'en' if you don't know what it means :)
                                              brand_name: 'e-Shop', #The name of the company
                                              allow_guest_checkout: 'true',   #payment with credit card for non PayPal users
        items: items #array of hashes, amount is a price in cents

    )

    redirect_to EXPRESS_GATEWAY.redirect_url_for(response.token)
  end

  def new
    @order = Order.new(:express_token => params[:token])
    reset_session
  end
end
