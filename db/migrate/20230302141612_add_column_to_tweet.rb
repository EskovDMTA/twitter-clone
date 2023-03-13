class AddColumnToTweet < ActiveRecord::Migration[7.0]
  def change
    add_column :tweets, :parent_id, :integer
  end
end
