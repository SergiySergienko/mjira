class Ticket < ActiveRecord::Base
  extend FriendlyId
  include Relationships::Ticket
  include Validations::Ticket
  include TicketExt::Methods

  after_initialize :set_default_status
  after_create :send_mail


  protected

  def set_default_status
    self.ticket_status_id ||= 1
  end

  def send_mail
    TicketMailer.ticket_posted(self).deliver
  end

end
