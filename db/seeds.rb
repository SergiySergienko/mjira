user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

TicketStatusesPoppulator.new.call
puts 'POPPULATE TICKET STATUSES'

