module Relationships::TicketComment
  extend ActiveSupport::Concern

  included do
    belongs_to :ticket
  end
end