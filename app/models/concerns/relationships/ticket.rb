module Relationships::Ticket
  extend ActiveSupport::Concern

  included do
    has_many :comments, dependent: :destroy
    belongs_to :ticket_status
    belongs_to :accepted_by, class_name: 'User'

    scope :assigned_to, lambda { |user| where(accepted_by_id: user) }
    scope :unassigned, -> { where(accepted_by_id: nil) }
  end
end