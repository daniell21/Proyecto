require 'rufus-scheduler'

scheduler = Rufus::Scheduler::singleton

scheduler.every '1h' do
  Mailreminder.send_mail
end