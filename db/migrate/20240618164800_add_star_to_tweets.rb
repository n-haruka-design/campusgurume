class AddStarToTweets < ActiveRecord::Migration[6.1]
  def change
    add_column :tweets, :star, :integer
  end
end
