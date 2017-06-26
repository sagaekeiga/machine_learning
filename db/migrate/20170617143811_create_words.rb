class CreateWords < ActiveRecord::Migration[5.0]
  def change
    create_table :words do |t|
      t.text :word1
      t.text :word2
      t.text :word3

      t.timestamps
    end
  end
end
