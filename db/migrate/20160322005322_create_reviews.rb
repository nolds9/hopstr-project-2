class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :user, index: true, foreign_key: true
      t.references :beer, index: true, foreign_key: true
      t.string :body
    end
  end
end
