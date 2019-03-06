class RemoveCityAndZipFromBikes < ActiveRecord::Migration[5.2]
  def change
    remove_column :bikes, :city
    remove_column :bikes, :zipcode
    remove_column :bikes, :country
  end
end
