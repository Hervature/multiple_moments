class AddPublishDataToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :author_url, :string
    add_column :articles, :public_access, :boolean, default: false
    add_column :articles, :published, :boolean, default: false
    add_column :articles, :featured, :boolean, default: false
    add_column :articles, :published_at, :datetime
  end
end
