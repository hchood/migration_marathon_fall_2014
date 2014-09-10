class AddNullConstraintToReaderId < ActiveRecord::Migration
  def change
    change_column_null :checkouts, :reader_id, false
  end
end
