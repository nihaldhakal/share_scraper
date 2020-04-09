class Share < ApplicationRecord
  belongs_to :user
  has_many :price_histories
  has_many :earnings_per_shares

  validates_presence_of  :url

  attr_accessor :scraped_attrs

  before_validation :do_initial_scrape

  def scraped_attrs
    @scraped_attrs ||= Scraper.new(url).attributes
  end

  def do_initial_scrape
    self.name = scraped_attrs[:name]
    self.price_to_earning = scraped_attrs[:price_to_earning]
  end
end
