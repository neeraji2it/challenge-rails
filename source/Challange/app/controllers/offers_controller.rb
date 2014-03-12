class OffersController < ApplicationController
  def index
    @offers = Offer.all
  end
  
  def create
    Offer.create_offers
    redirect_to offers_path
  end
end
