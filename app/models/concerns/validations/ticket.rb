module Validations::Ticket
  extend ActiveSupport::Concern

  included do
    validates_uniqueness_of :slug
    validates_presence_of :title, :description, :customer_name, :customer_email
    validates :customer_email, format: /@/
  end
end