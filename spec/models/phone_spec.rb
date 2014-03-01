require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Phone do
  it { should belong_to :phone_type }
end