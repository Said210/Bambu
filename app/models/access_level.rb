class AccessLevel < ApplicationRecord
  has_many :users
  has_many :registration_codes
end
