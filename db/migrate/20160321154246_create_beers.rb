class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.string :name
      t.float :abv
      t.float :ibu
      t.string :img_url
      t.string :brewery
      t.string :location
    end
  end
end
