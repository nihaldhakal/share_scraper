class Share < ApplicationRecord
  belongs_to :user
  has_many :price_histories
  has_many :earnings_per_shares

  validates_presence_of  :url
end
