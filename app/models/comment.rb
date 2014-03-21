class Comment < ActiveRecord::Base
  include Relationships::TicketComment
  include Validations::Comment
end
