class OrdersController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:completeorder]

  def express
    total = Cart.total(session[:session_id])
    items = Cart.items_in_cart(session[:session_id])
    response = EXPRESS_GATEWAY.setup_purchase((total * 100).to_i,
                                              :ip                => request.remote_ip,
                                              :return_url        => orders_new_url,
                                              :cancel_return_url => products_url,
                                              currency: 'GBP',
                                              locale: I18n.locale.to_s.sub(/-/, '_'), #you can put 'en' if you don't know what it means :)
                                              brand_name: 'e-Shop', #The name of the company
                                              allow_guest_checkout: 'true',   #payment with credit card for non PayPal users
        items: items #array of hashes, amount is a price in cents
    )

    if response.params["ack"] == "Success"
      redirect_to EXPRESS_GATEWAY.redirect_url_for(response.token)
    else
      flash[:error] = response.params["message"]
      redirect_to request.referer and return
    end
  end

  def new
    @order = Order.new(:express_token => params[:token])
  end

  def completeorder
    @order = Order.new(:express_token =>  params[:order][:express_token], :express_payer_id => params[:order][:express_payer_id], :session_id => session[:session_id])
    @order.save
    order_number = generate_order_number(@order.id)
    @order =  Order.find_by_id(@order.id)
    @order.order_number = order_number
    @order.save
    set_purchased_at
    reset_session
    @order
  end

  private
  def set_purchased_at
    Cart.update_all("purchased_at = '#{DateTime.now.strftime('%Y-%m-%d %H:%M:%S')}'", "session_id = '#{session[:session_id]}'")
  end

  def generate_order_number(order_no)
    "ESHOP-%.6d" % order_no
  end
end
