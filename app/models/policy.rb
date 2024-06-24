class Policy < ApplicationRecord
  belongs_to :insured
  has_one :vehicle, dependent: :destroy
end
