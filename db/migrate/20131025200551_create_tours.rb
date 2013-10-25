class CreateTours < ActiveRecord::Migration
  def change
    create_table :tours do |t|
      t.date :start_date
      t.date :end_date
      t.string :questions
      t.integer :tourist_id


      t.timestamps
    end
  end
end
