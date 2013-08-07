class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.integer :click_count
      t.string :long_url
      t.string :end_url
    end
  end
end
