class RemoveBobyFromBook < ActiveRecord::Migration[6.1]
  def change
    remove_column :books, :boby, :text
  end
end
