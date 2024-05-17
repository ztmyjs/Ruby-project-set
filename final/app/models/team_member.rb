class TeamMember < ApplicationRecord
    validates :user_id, uniqueness: { scope: :team_id, 
        message: "User is already a member of this team!"
    }

    belongs_to :user
    belongs_to :team
end
