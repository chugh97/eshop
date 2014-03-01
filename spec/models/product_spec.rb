require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Product do
  it { should belong_to :category }
  it { should have_many :carts }
  it { should have_many :product_prices }

  it "displays an error when category is not set" do
    product = described_class.new
    product.valid?
    product.errors.messages[:category_id].should include "can't be blank"
  end

  it "should get the right product price" do
    product = described_class.new(:category_id => 1)
    product.save!
    product.product_prices << ProductPrice.new(:effective_start_date => 2.days.ago, :price => 10.99)
    product.product_prices << ProductPrice.new(:effective_start_date => 1.days.ago, :price => 15.99)

    binding.pry
    product.get_product_price.price.should == 15.99
  end

end