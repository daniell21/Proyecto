require 'rufus-scheduler'
scheduler = Rufus::Scheduler.new
#scheduler = Rufus::Scheduler::singleton
#Un dia son 86400 segundos
#quince dias son 1296000 segundos
#treinta dias son 2592000  segundos
dailyFrecuency = '86400s'
biWeeklyFrecuency = '1296000s'
monthlyFrecuency = '2592000s'
@time = '360s'
@time2 = '60s'
  scheduler.every '1h' do
  
    #PaymentMailer.delay.new_payment(client)
    #AdminMailer.delay.new_adminreminder(client)
  end
  #scheduler pay reminder
  scheduler.every @time do
    print "enviando correo"
   
      clients = Client.all
    clients.each do |client|
      print client.name
          ReminderMailer.delay.new_sendreminder(client)
  #       if client.chargeMonthlyFee
  #       id = Accountreceivable.last.id + 1
  #       puts id
  #       @accountreceivable = Accountreceivable.new
  #             @accountreceivable.id = id
  #             @accountreceivable.client_id = client.id
  #             @accountreceivable.status = "facturada"
  #             @accountreceivable.concept = "mensualidad"
  #             @accountreceivable.paid = "no"
  #             @accountreceivable.month = "enero"
  #             @accountreceivable.save
    end
  end
  #scheduler admin reminder
  scheduler.every @time2 do
    
    print 'tiempo dos'
    print @time2
  end




# end