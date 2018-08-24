require 'google/apis/calendar_v3'
require 'googleauth'
require 'googleauth/stores/file_token_store'
require 'fileutils'
require 'byebug'

scope = 'https://www.googleapis.com/auth/calendar'

authorizer = Google::Auth::ServiceAccountCredentials.make_creds(
    json_key_io: File.open('./service_account.json'),
      scope: scope
)

service = Google::Apis::CalendarV3::CalendarService.new
service.authorization = authorizer
service.client_options.application_name = "ub_scheduler"

calendar_id = ENV['CORE_CALENDAR']
response = service.list_events(calendar_id, max_results: 10, single_events: true, order_by: 'startTime', time_min: Time.now.iso8601)
puts 'Upcoming events:'
puts 'No upcoming events found' if response.items.empty?

response.items.each do |event|
	start = event.start.date || event.start.date_time
	puts "- #{event.summary} (#{start})"
end
