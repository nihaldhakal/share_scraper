class Share < ApplicationRecord
  belongs_to :user
  has_many :price_histories, dependent: :destroy
  has_many :earnings_per_shares, dependent: :destroy
  accepts_nested_attributes_for :earnings_per_shares, allow_destroy: true

  validates_presence_of  :url

  attr_accessor :scraped_attrs

  before_validation :do_initial_scrape


  def scraped_attrs
    @scraped_attrs ||= Scraper.new(url).attributes
  end

  def update_pe_attr
    self.update(price_to_earning: scraped_attrs[:price_to_earning])
  end

  def update_eps_attr

  end

  def do_initial_scrape
    self.name = scraped_attrs[:name]
    self.price_to_earning = scraped_attrs[:price_to_earning]
  end

  def after_creation_scrape
    eps = self.earnings_per_shares.find_by(share_id: self.id)
    debugger
    eps.value = scraped_attrs[:value]
  end
end
