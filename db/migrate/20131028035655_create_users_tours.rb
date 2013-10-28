class CreateUsersTours < ActiveRecord::Migration
  def change
    create_table :users_tours do |t|
      t.integer :user_id
      t.integer :tour_id
      t.integer :rating

      t.timestamps
    end
  end
end
