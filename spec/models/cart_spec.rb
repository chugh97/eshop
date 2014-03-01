require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Cart do
  before :each do
    cart_item = Cart.new :product_id => 18, :unit_price => 6.50, :quantity => 7, :session_id => 999
    cart_item2 = Cart.new :product_id => 29, :unit_price => 12.50, :quantity => 10, :session_id => 999
    cart_item.save
    cart_item2.save
  end
  it { should belong_to :product }

  it "should get the right total" do
    expect(described_class.total(999)).to eq(170.50)
  end

  it "should have the correct items" do
    described_class.any_instance.stub(:as_json).and_return('product' => {'name' => 'Soap','description' => "Some desc" },
                                                           'quantity' => 10, 'unit_price' => 5
                                                           )

    result = [{:name=>"Soap", :description=>"Some desc", :quantity=>10, :amount=>50}, {:name=>"Soap", :description=>"Some desc", :quantity=>10, :amount=>50}]
    expect(described_class.items_in_cart(999)).to eq(result)
  end

end