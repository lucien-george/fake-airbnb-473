require 'json'
require 'open-uri'

class FlatsController < ApplicationController
  FLATS_URL = 'https://raw.githubusercontent.com/lewagon/flats-boilerplate/master/flats.json'.freeze
  before_action :set_flats #, only: [:index, :show]

  def index; end

  def show
    id = params[:id]
    @flat = @flats.find { |flat| flat['id'] == id.to_i }
  end

  private

  def set_flats
    response = open(FLATS_URL).read
    @flats = JSON.parse(response)
  end
end

# FLAT
# {
#   "id": 145,
#   "name": "Charm at the Steps of the Sacre Coeur/Montmartre",
#   "imageUrl": "https://raw.githubusercontent.com/lewagon/flats-boilerplate/master/images/flat1.jpg",
#   "price": 164,
#   "priceCurrency": "EUR",
#   "lat": 48.884211,
#   "lng": 2.346890
# }
