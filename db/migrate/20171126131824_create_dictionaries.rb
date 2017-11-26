class CreateDictionaries < ActiveRecord::Migration
  def change
    create_table :dictionaries do |t|
      t.string :main_word
      t.string :pronounce
      t.string :type
      t.string :meaning
      t.text :example

      t.timestamps null: false
    end
  end
end
