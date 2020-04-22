class CreateExperiences < ActiveRecord::Migration[6.0]
  def change
    create_table :experiences do |t|
      t.string :name
      t.decimal :rating
      t.string :client_ip

      t.timestamps
    end
  end
end
