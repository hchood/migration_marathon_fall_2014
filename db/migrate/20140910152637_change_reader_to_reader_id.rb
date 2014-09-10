class ChangeReaderToReaderId < ActiveRecord::Migration
  def up
    add_column :checkouts, :reader_id, :integer, null: false
    rename_column :checkouts, :reader, :reader_name

    Checkout.reset_column_information

    checkouts = Checkout.all
    checkouts.each do |checkout|
      reader_attrs = {
        first_name: checkout.reader_name,
        last_name: 'Smith',
        email: "#{checkout.reader_name}smith@example.com",
        phone_number: '(617) 555-2349'
      }
      reader = Reader.find_or_create_by(reader_attrs)
      checkout.reader_id = reader.id
      checkout.save
    end

    remove_column :checkouts, :reader_name
  end

  def down
    add_column :checkouts, :reader_name, :string, null: false

    Checkout.reset_column_information
    checkouts = Checkout.all
    checkouts.each do |checkout|
      checkout.reader_name = reader.first_name
      checkout.save
    end

    rename_column :checkouts, :reader_name, :reader
    remove_column :checkouts, :reader_id
  end
end
