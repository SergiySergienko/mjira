module TicketExt::Methods
  extend ActiveSupport::Concern

  included do
    friendly_id :slug_candidates, use: [:slugged, :finders]
  end

  def slug_candidates
    [[get_rand_str_slug, get_rand_digit_slug, get_rand_str_slug, get_rand_digit_slug]]
  end

  def assign_to(user)
    return unless user.present?
    self.accepted_by = (self.accepted_by_id? ? nil : user)
    self.save!
  end

  def is_my?(user_to_compare)
    self.accepted_by == user_to_compare
  end

  protected

  def get_rand_str_slug
    letters = Proc.new {[*('A' .. 'Z')].shuffle!}.call
    result = ""
    3.times { result << "#{letters[rand(letters.length-1)]}" }
    result
  end

  def get_rand_digit_slug
    digits = Proc.new { [*(0 .. 9)].shuffle! }.call
    result = ""
    3.times { result << "#{digits[rand(digits.length-1)]}" }
    result
  end

end