class DropReaderNameFromCheckouts < ActiveRecord::Migration
  def up
    remove_column :checkouts, :reader_name
  end

  def down
    # first, add the column back w/o the null constraint
    add_column :checkouts, :reader_name, :string

    # second, repopulate the reader_name column
    checkouts = Checkout.all

    checkouts.each do |checkout|
      checkout.reader_name = "#{checkout.reader.first_name} #{checkout.reader.last_name}"
      checkout.save
    end

    # finally, add the null constraint again
    change_column_null :checkouts, :reader_name, false
  end
end
