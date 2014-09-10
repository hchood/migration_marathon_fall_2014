class PopulateReaderIdOnCheckouts < ActiveRecord::Migration
  def up
    checkouts = Checkout.all

    checkouts.each do |checkout|
      first_name = checkout.reader_name.split[0]
      last_name = checkout.reader_name.split[1..-1].join(" ")

      reader_attrs = {
        first_name: first_name,
        last_name: last_name,
        email: "#{checkout.reader_name}smith@example.com",
        phone_number: '(617) 555-2349'
      }
      reader = Reader.find_or_create_by(reader_attrs)
      checkout.reader = reader
      checkout.save
    end
  end

  # you probably don't really need to have this down method.  Ultimately,
  # it shouldn't matter if your reader_id column is populated or not for
  # the purposes of migrating or rolling back
  def down
    checkouts = Checkout.all

    checkouts.each do |checkout|
      checkout.reader = nil
      checkout.save
    end
  end
end
