class CreatePoliticians < ActiveRecord::Migration[5.0]
  def change
    create_table :politicians do |t|
      t.text :name
      t.text :age
      t.text :image
      t.text :party
      t.text :occupation
      t.text :status
      t.text :vote
      t.text :election
      t.text :switch

      t.timestamps
    end
  end
end
