require 'spec_helper'

describe Merchant do
  
  def merchant
    Merchant.new
  end
  
  describe "associations" do
    it "has many offers" do
      Merchant.reflect_on_association(:offers).to_hash.should == {
        :macro => :has_many,
        :options => {:dependent => :destroy, :extend => []},
        :class_name => "Offer"
      }
    end
  end
end
