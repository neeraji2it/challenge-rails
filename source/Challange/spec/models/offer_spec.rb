require 'spec_helper'

describe Offer do
  def offer
    Offer.new
  end
  
  it "Should create offers" do
    cj = CommissionJunction.new(DEVELOPER_KEY, WEBSITE_ID)
    cj.link_search('keywords' => 'ebooks',
      'records-per-page' => '20').each do |link|
      merchant = Merchant.where("add_id = ?", link.advertiser_id).first_or_create(add_id: link.advertiser_id, add_name: link.advertiser_name)
      Offer.where("link_id = ? and merchant_id = ?", link.link_id, merchant.id).first_or_create(title: link.link_name, description: link.description, url: link.destination,expires_at: link.promotion_end_date, merchant_id: merchant.id, link_id: link.link_id)
    end
  end
  
  
  describe "associations" do
    it "belongs to Merchant" do
      Offer.reflect_on_association(:merchant).to_hash.should == {
        :macro => :belongs_to,
        :class_name => "Merchant",
        :options => {}
      }
    end
  end
end
