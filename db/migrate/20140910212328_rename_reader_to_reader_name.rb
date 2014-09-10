class RenameReaderToReaderName < ActiveRecord::Migration
  def change
    rename_column :checkouts, :reader, :reader_name
  end
end
