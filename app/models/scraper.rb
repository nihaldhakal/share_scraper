require 'httparty'
require 'nokogiri'

class Scraper
  attr_accessor :parsed_data
  def initialize(share_url)
    html = HTTParty.get(share_url)
    @parsed_data ||= Nokogiri::HTML.parse(html)
  end

  def name
    item_container.css(".page-header").text() rescue nil
  end

  def price_to_earning
    item_container.css("table td").children[17].text() rescue nil
  end

  def item_container
    parsed_data.css(".container") rescue nil
  end

  def attributes
    {
        name: name,
        price_to_earning: price_to_earning
    }
  end
end
