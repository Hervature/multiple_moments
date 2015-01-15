class FixArticlesColumnName < ActiveRecord::Migration
  def change
    rename_column :articles, :body, :markup
  end
end
