require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Address do
  it { should belong_to :user }
  it { should belong_to :address_type }
end