class TicketStatusesPoppulator
  def call
    load_data.each do |status_title|
      TicketStatus.find_or_create_by!(title: status_title) do |ticket_status|
        ticket_status.title = status_title
      end
    end
  end

  private

  def load_data
    yaml = "#{Rails.root}/config/statuses.yml"
    if File.exist?(yaml)
      require "erb"
      data = YAML.load(ERB.new(IO.read(yaml)).result) || {}
      data = data[Rails.env].try(:symbolize_keys)
      data[:statuses] || []
    end
  end

end