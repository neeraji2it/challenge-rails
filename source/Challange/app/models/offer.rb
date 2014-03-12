class Offer < ActiveRecord::Base
  belongs_to :merchant
  validates :title, :presence => true, :uniqueness => {scope: :merchant}
  
  def self.create_offers
    cj = CommissionJunction.new(DEVELOPER_KEY, WEBSITE_ID)
    cj.link_search('keywords' => 'ebooks',
      'records-per-page' => '20').each do |link|
      merchant = Merchant.where("add_id = ?", link.advertiser_id).first_or_create(add_id: link.advertiser_id, add_name: link.advertiser_name)
      Offer.where("link_id = ? and merchant_id = ?", link.link_id, merchant.id).first_or_create(title: link.link_name, description: link.description, url: link.destination,expires_at: link.promotion_end_date, merchant_id: merchant.id, link_id: link.link_id)
    end
  end
end
