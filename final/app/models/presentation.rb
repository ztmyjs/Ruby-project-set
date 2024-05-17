class Presentation < ApplicationRecord
    belongs_to :team
    has_many :surveys
end
