class CreateMachines < ActiveRecord::Migration[5.0]
  def change
    create_table :machines do |t|
      t.date :date
      t.bigint :tweet_id
      t.text :name
      t.text :text
      t.text :geo
      t.text :url
      t.text :mecab
      t.text :politician

      t.timestamps
    end
  end
end
