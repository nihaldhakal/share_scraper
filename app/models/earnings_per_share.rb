class EarningsPerShare < ApplicationRecord
  belongs_to :share

  def eps_date_quarter
    @eps = EarningsPerShare.find_by(share_id: share.id)
    @eps.date = Date.current.strftime('%Y').to_i
    month = Date.current.strftime('%m').to_i
    @eps.quarter = if month == 1 || month ==2 || month == 3
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
