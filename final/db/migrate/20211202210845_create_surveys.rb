class CreateSurveys < ActiveRecord::Migration[6.0]
  def change
    create_table :surveys do |t|
      t.string :comments
      t.string :overall

      t.integer :organization_1
      t.integer :organization_2
      t.integer :organization_3
      t.integer :organization_4
      t.integer :organization_5
      t.integer :organization_6
      t.integer :organization_7

      t.integer :content_1
      t.integer :content_2
      t.integer :content_3
      t.integer :content_4

      t.integer :visuals_1
      t.integer :visuals_2
      t.integer :visuals_3
      t.integer :visuals_4
      t.integer :visuals_5

      t.integer :delivery_1
      t.integer :delivery_2
      t.integer :delivery_3
      
      t.timestamps
    end
  end
end
