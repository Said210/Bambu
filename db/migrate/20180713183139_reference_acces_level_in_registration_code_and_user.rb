class ReferenceAccesLevelInRegistrationCodeAndUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :access_level
    remove_column :registration_codes, :access_level

    add_reference :users, :access_level, foreign_key: true, null: false
    add_reference :registration_codes, :access_level, foreign_key: true, null: false
  end
end
