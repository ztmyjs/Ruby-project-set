class AddReferences < ActiveRecord::Migration[6.0]
  def change
    add_reference :surveys, :presentation, index: true
    add_reference :surveys, :user, index: true

    add_reference  :team_members, :team, index: true
    add_reference :team_members, :user, index: true

    add_reference :presentations, :team, index: true
  end
end
