class UpdateSurveyColumnTypes < ActiveRecord::Migration[6.0]
  def change
    change_column :surveys, :organization_1, :string
    change_column :surveys, :organization_2, :string
    change_column :surveys, :organization_3, :string
    change_column :surveys, :organization_4, :string
    change_column :surveys, :organization_5, :string
    change_column :surveys, :organization_6, :string
    change_column :surveys, :organization_7, :string

    change_column :surveys, :content_1, :string
    change_column :surveys, :content_2, :string
    change_column :surveys, :content_3, :string
    change_column :surveys, :content_4, :string

    change_column :surveys, :visuals_1, :string
    change_column :surveys, :visuals_2, :string
    change_column :surveys, :visuals_3, :string
    change_column :surveys, :visuals_4, :string
    change_column :surveys, :visuals_5, :string

    change_column :surveys, :delivery_1, :string
    change_column :surveys, :delivery_2, :string
    change_column :surveys, :delivery_3, :string
  end
end
