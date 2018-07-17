class AddVimeoToLecture < ActiveRecord::Migration[5.2]
  def change
    add_column :lectures, :vimeo, :string, null: false
  end
end
