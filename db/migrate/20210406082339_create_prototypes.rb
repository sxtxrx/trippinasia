class CreatePrototypes < ActiveRecord::Migration[6.0]
  def change
    create_table :prototypes do |t|
      t.string :title,  null:false
      t.text :access 
      t.integer :country_id, null: false
      t.text    :information, null:false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
