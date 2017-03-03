class CreateMachines < ActiveRecord::Migration[5.0]
  def change
    create_table :machines do |t|
      t.date :date
      t.text :tweet
      t.text :name
      t.text :text

      t.timestamps
    end
  end
end
