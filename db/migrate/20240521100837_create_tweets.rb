class CreateTweets < ActiveRecord::Migration[6.1]
  def change
    create_table :tweets do |t|
      t.string :shop
      t.string :genre
      t.string :access
      t.text :about
      t.string :menu

      t.timestamps
    end
  end
end
