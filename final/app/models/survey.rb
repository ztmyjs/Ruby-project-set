class Survey < ApplicationRecord
    include ActiveModel::Validations

    validates :user_id, uniqueness: { scope: :presentation_id,
        message: "You have already completed a survey for this presentation!"
    }
    validates_with SurveyValidator

    belongs_to :user
    belongs_to :presentation
end
