class ChangeBikeType < ActiveRecord::Migration[7.1]
  def change
    rename_column :bikes, :type, :category
  end
end
