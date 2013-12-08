class Cart < ActiveRecord::Base
  belongs_to :product                   #foreign_key product_id

  def self.total(session_id)
     self.where('session_id = ?', session_id).sum('unit_price * quantity')
  end

  def self.items_in_cart(session_id)
    cart_json = self.where('session_id = ?', session_id).as_json

    cart_json.collect do |line_item|
      product = line_item['product']

      {
          :name => product['name'],
          :number => product['description'],
          :quantity => line_item['quantity'],
          :amount => line_item['unit_price'] * 100
      }
    end
  end

  def as_json(options={ })
    super({:include => [:product]}.merge(options))
  end
end
