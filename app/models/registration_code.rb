class RegistrationCode < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :access_level

  def redeem
    self.redeemed = true
    self.save
  end
end
