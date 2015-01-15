class AddColumnsToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :html, :text
    add_column :articles, :author, :string
    add_column :articles, :header_id, :integer
    add_index  :articles, :header_id
  end
end
