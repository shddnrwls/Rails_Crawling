class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.string :title
      t.text :content

      t.timestamps null: false
    end
  end
end
