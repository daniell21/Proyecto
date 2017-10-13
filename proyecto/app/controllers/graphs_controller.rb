class GraphsController < ApplicationController

  def index
  	
  	

    
      redirect_to graphs_show_amountPaid_path
    
  




  	
  	#Cantidad de cuentas por clientes
  	@accountreceivables_count = Client.joins("left join accountreceivables on clients.id = accountreceivables.client_id").group("clients.id, accountreceivables.client_id").select("clients.*, count(accountreceivables.id) as cuenta_accountreceivables").collect{|x| [x.name, x.cuenta_accountreceivables]}
  	#Cantidad de cuentas por tipo de Pago
  	@accountreceivablesRatesPercentage = Rate.joins(:accountreceivables).group("rates.id, accountreceivables.rate_id").select("rates.name, count(accountreceivables.id) as instalaciones").collect{|x| [x.name  + " " +(ActionController::Base.helpers.number_with_precision((((x.instalaciones).to_f * 100.00)/(Rate.joins(:accountreceivables).count).to_f), :precision => 2)).to_s + "%", x.instalaciones]}

  	@prueba = User.group_by_day(:created_at, range: 2.weeks.ago.midnight..Time.now).count



  end
  def show_amountPaid
    Time.use_zone('Caracas') do
      @presentMonth = Time.zone.now.month
  end 
  @thirdMonth = @presentMonth - 1
  @secondMonth = @thirdMonth - 1 
  @firstMonth = @secondMonth - 1

  #Monto facturado vs Monto pagado (Último trimestre)
  @thirdMountAmountInvoicedvsPaid = Rate.joins(:accountreceivables).where("accountreceivables.status = ? and accountreceivables.month == ?", "Facturada", @thirdMonth).select("('Monto Facturado') as m, sum(rates.amount) as montos").union(Rate.joins(:accountreceivables).where("accountreceivables.paid = ? and accountreceivables.month == ?", true, @thirdMonth).select("('Monto Pagado') as m, sum(accountreceivables.amountPaid) as montos")).collect{|x| [ x.m + " " + ActionController::Base.helpers.number_to_currency(x.montos, unit: "Bs ", separator: ",", delimiter: ".", precision: 2).to_s, x.montos]}
  @secondMountAmountInvoicedvsPaid = Rate.joins(:accountreceivables).where("accountreceivables.status = ? and accountreceivables.month == ?", "Facturada", @secondMonth).select("('Monto Facturado') as m, sum(rates.amount) as montos").union(Rate.joins(:accountreceivables).where("accountreceivables.paid = ? and accountreceivables.month == ?", true, @secondMonth).select("('Monto Pagado') as m, sum(accountreceivables.amountPaid) as montos")).collect{|x| [ x.m + " " + ActionController::Base.helpers.number_to_currency(x.montos, unit: "Bs ", separator: ",", delimiter: ".", precision: 2).to_s, x.montos]}
  @firstMountAmountInvoicedvsPaid = Rate.joins(:accountreceivables).where("accountreceivables.status = ? and accountreceivables.month == ?", "Facturada", @firstMonth).select("('Monto Facturado') as m, sum(rates.amount) as montos").union(Rate.joins(:accountreceivables).where("accountreceivables.paid = ? and accountreceivables.month == ?", true, @firstMonth).select("('Monto Pagado') as m, sum(accountreceivables.amountPaid) as montos")).collect{|x| [ x.m + " " + ActionController::Base.helpers.number_to_currency(x.montos, unit: "Bs ", separator: ",", delimiter: ".", precision: 2).to_s, x.montos]}
  
  #Monto facturado vs Monto pagado (Historico)                                  
  @historicalAmountInvoicedvsPaid = Rate.joins(:accountreceivables).where("accountreceivables.status = ?", "Facturada").select("('Monto Facturado') as m, sum(rates.amount) as montos").union(Rate.joins(:accountreceivables).where("accountreceivables.paid = ?", true,).select("('Monto Pagado') as m, sum(accountreceivables.amountPaid) as montos")).collect{|x| [ x.m + " " + ActionController::Base.helpers.number_to_currency(x.montos, unit: "Bs ", separator: ",", delimiter: ".", precision: 2).to_s, x.montos]}

  #Monto facturado vs Monto pagado (Mes Actual)
  @presentMountAmountInvoicedvsPaid = Rate.joins(:accountreceivables).where("accountreceivables.status = ? and accountreceivables.month == ?", "Facturada", @presentMonth).select("('Monto Facturado') as m, sum(rates.amount) as montos").union(Rate.joins(:accountreceivables).where("accountreceivables.paid = ? and accountreceivables.month == ?", true, @presentMonth).select("('Monto Pagado') as m, sum(accountreceivables.amountPaid) as montos")).collect{|x| [ x.m + " " + ActionController::Base.helpers.number_to_currency(x.montos, unit: "Bs ", separator: ",", delimiter: ".", precision: 2).to_s, x.montos]}

  

end
def show_clientsDebtors
  @topDebtorsbyAmount = Client.joins("left join accountreceivables on clients.id = accountreceivables.client_id").group("clients.id, accountreceivables.client_id").where('accountreceivables.accountBalance < 0').select("clients.*, (sum(accountreceivables.accountBalance)) as cuenta_accountreceivables").order('cuenta_accountreceivables DESC').limit(10).collect{|x| [x.name + " " + ActionController::Base.helpers.number_to_currency(x.cuenta_accountreceivables, unit: "Bs ", separator: ",", delimiter: ".", precision: 2).to_s, (-1 * x.cuenta_accountreceivables), x.rif]}


  #e. Top clientes deudores (por meses adeudados)
  @topDebtorsbyMonth = Client.joins("left join accountreceivables on clients.id = accountreceivables.client_id").group("clients.id, accountreceivables.client_id").where('accountreceivables.paid == ?', false).select("clients.*, count(accountreceivables.month) as cuenta_accountreceivables").order('cuenta_accountreceivables DESC').limit(10).collect{|x| [x.name+ " " + (x.cuenta_accountreceivables).to_s + " Meses", x.cuenta_accountreceivables, x.rif]}

end
def show_facilities
  Time.use_zone('Caracas') do
      @presentMonth = Time.zone.now.month
  end 
  @install = Rate.joins(:accountreceivables).group("rates.id, accountreceivables.rate_id").where('rates.name == ? and accountreceivables.month == ?',"Instalación", @presentMonth).select("rates.*, count(accountreceivables.id) as instalaciones").collect{|x| ["Instalaciones: " + x.instalaciones.to_s, x.instalaciones]}


end
def show_accountTypes
  #Cantidad de cuentas por status
  Time.use_zone('Caracas') do
      @presentMonth = Time.zone.now.month
  end 
  @accountreceivables_type = Accountreceivable.group(:status).where('accountreceivables.month == ?', @presentMonth).select("accountreceivables.*, count(accountreceivables.id) as estatus").collect{|x| [x.status + ": " + x.estatus.to_s, x.estatus]}

  
end
end
