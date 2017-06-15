require 'rufus-scheduler'

scheduler = Rufus::Scheduler::singleton

scheduler.every '1h' do
  Client.all.each do |client|
   	    ReminderMailer.delay.new_sendreminder(client)
   	    puts client.email
   	end
end