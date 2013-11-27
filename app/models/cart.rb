class Cart < ActiveRecord::Base
  belongs_to :product                   #foreign_key product_id


  def as_json(options={ })
    super({:include => [:product]}.merge(options))
  end
end
