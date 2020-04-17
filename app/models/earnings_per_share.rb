class EarningsPerShare < ApplicationRecord
  belongs_to :share

  def self.current_year
    Date.current.strftime('%Y').to_i
  end
  
  def self.current_quarter
    month = Date.current.strftime('%m').to_i
    if month == 1 || month ==2 || month == 3
      'Q1'
    elsif month ==4 || month ==5 || month == 6
      'Q2'
    elsif month ==7 || month ==8 || month == 9
      'Q3'
    else
      'Q4'
    end
  end
end
