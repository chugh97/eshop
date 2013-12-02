class OrdersController < ApplicationController
  def express
    response = EXPRESS_GATEWAY.setup_purchase(10,
                                              :ip                => request.remote_ip,
                                              :return_url        => orders_new_url,
                                              :cancel_return_url => products_url
    )
    redirect_to EXPRESS_GATEWAY.redirect_url_for(response.token)
  end

  def new
    @order = Order.new(:express_token => params[:token])
  end
end
