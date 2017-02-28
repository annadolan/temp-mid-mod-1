class ChangeColumnOnReads < ActiveRecord::Migration[5.0]
  def change
    remove_column :reads, :link_id
    add_column :reads, :url, :string
  end
end
