class AddDetailToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :step, :integer
  end
end
