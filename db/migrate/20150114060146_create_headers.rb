class CreateHeaders < ActiveRecord::Migration
  def change
    create_table :headers do |t|
      t.string :title
      t.boolean :show_in_nav, default: true

      t.timestamps
    end
  end
end
