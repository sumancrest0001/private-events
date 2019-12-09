class Event < ApplicationRecord
  belongs_to :creator, foreign_key: :creator_id, class_name: "User"
  has_many :relationships, foreign_key: :attended_event_id
  has_many :attendees, through: :relationships, source: :attendee

  def feed
    Relationship.where("attended_event_id = ?", id)
  end

end
