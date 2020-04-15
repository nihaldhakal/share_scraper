class ScrapeScheduler
  attr_reader :time

  def self.run!
    new(Time.current.to_i).run!
  end

  def initialize(time_in_seconds)
    @time = Time.zone.at(time_in_seconds)
  end

  def run!
    Share.all.each(&:update_attrs)
  end

end

