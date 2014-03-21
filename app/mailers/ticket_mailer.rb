class TicketMailer < ActionMailer::Base
  default from: "admin@localhost"

  def ticket_posted(ticket)
    @ticket = ticket
    mail(to: ticket.customer_email, subject: 'Thanks for your feedback')
  end

end
