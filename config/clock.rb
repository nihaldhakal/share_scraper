require 'clockwork'
require './config/boot'
require './config/environment'

module Clockwork
  every(1.second, 'scrape.scheduler') do
    ScrapeScheduler.run!
  end
  every(1.year, 'scrape.scheduler') do

  end
end