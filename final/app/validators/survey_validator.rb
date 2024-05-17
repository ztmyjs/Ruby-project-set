class SurveyValidator < ActiveModel::Validator
    def validate(survey)
        @presentation = Presentation.find_by(id: survey.presentation_id)
        @team = Team.find(@presentation.team_id)
        if @team.users.exists?(:id => survey.user_id)
            survey.errors.add(:base, "You cannot submit a survey for your own presentation!")
        end
    end
end