class AddDetailsToTweets < ActiveRecord::Migration[6.1]
  def change
    add_column :tweets, :name, :string
    add_column :tweets, :detail, :string
    add_column :tweets, :price, :integer
    add_column :tweets, :link, :string
  end
end
