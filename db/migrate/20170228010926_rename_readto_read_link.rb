class RenameReadtoReadLink < ActiveRecord::Migration[5.0]
  def change
    rename_table('reads', 'read_links')
  end
end
