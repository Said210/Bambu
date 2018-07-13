class AddIndexOnCodeToRegistrationCode < ActiveRecord::Migration[5.2]
  def change
    add_index :registration_codes, :code, unique: true
  end
end
