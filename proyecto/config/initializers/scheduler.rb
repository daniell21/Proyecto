require 'rufus-scheduler'
scheduler = Rufus::Scheduler.new
#scheduler = Rufus::Scheduler::singleton

#scheduler.every '1h' do
  #Client.all.each do |client|
   	    #ReminderMailer.delay.new_sendreminder(client)
   	    #puts client.email
   	#end
#end


#Todos los primero de mes a las 8 de la mañana se crearan las cuentas por cobrar de todos los clientes de Elemetrica
scheduler.cron '0 8 */1 * *' do
#0 0 1 * *
	
	
	Client.all.each do |client|
      if client.chargeMonthlyFee
   		id = Accountreceivable.last.id + 1
   		puts id
   		@accountreceivable = Accountreceivable.new
      	    @accountreceivable.id = id
      	    @accountreceivable.client_id = client.id
      	    @accountreceivable.status = "facturada"
      	    @accountreceivable.concept = "mensualidad"
      	    @accountreceivable.paid = "no"
      	    @accountreceivable.month = "enero"
      	    @accountreceivable.save
      end
   end

end