class CreateClicks < ActiveRecord::Migration[5.0]
  def change
    create_table :clicks do |t|
      t.string :search_term
      t.string :external_id
      t.integer :click_count

      t.timestamps
    end
  end
end
