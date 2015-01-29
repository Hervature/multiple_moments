class AddSlugToHeader < ActiveRecord::Migration
  def change
    add_column :headers, :slug, :string, :unique => true
  end
end
