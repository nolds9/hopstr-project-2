class CreatePubs < ActiveRecord::Migration
  def change
    create_table :pubs do |t|
      t.references :user, index: true, foreign_key: true
      t.references :beer, index: true, foreign_key: true
      t.integer :rating
    end
  end
end
