class CreateRegistrationCodes < ActiveRecord::Migration[5.2]
  def change
    create_table :registration_codes do |t|
      t.string :code
      t.integer :access_level
      t.boolean :redeemed, default: false
      t.references :user

      t.timestamps
    end
  end
end
