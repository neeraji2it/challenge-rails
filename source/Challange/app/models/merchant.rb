class Merchant < ActiveRecord::Base
  has_many :offers, :dependent => :destroy
  validates :add_id, :add_name, :presence => true, :uniqueness => {:scope => :add_id}
end
