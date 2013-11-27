class Cart < ActiveRecord::Base
  belongs_to :product


  def as_json(options={ })
    super({ :include => [:product] }.merge(options))
  end


end
