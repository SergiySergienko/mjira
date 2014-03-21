module Validations::Comment
  extend ActiveSupport::Concern

  included do
    validates_presence_of :body
  end

end