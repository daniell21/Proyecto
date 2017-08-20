class GraphsController < ApplicationController
  def index
  	
  	
  	Time.use_zone('Caracas') do
  		@presentMonth = Time.zone.now.month
	end	
	@thirdMonth = @presentMonth - 1
  	@secondMonth = @thirdMonth - 1
  	@firstMonth = @secondMonth - 1

  	#a. Monto facturado vs Monto pagado (Último trimestre)
  	@thirdMountAmountInvoicedvsPaid = Constant.joins(:accountreceivables).where("accountreceivables.month = ?", @thirdMonth).select("('Monto Facturado') as m, sum(constants.amount) as montos").union(Constant.joins(:accountreceivables).group(:paid).where('accountreceivables.paid = "si" and accountreceivables.month = ?', @thirdMonth).select("('Monto Pagado') as m, sum(accountreceivables.amountPaid) as montos")).collect{|x| [ x.m, x.montos]}
  	@secondMountAmountInvoicedvsPaid = Constant.joins(:accountreceivables).where("accountreceivables.month = ?", @secondMonth).select("('Monto Facturado') as m, sum(constants.amount) as montos").union(Constant.joins(:accountreceivables).group(:paid).where('accountreceivables.paid = "si" and accountreceivables.month = ?', @secondMonth).select("('Monto Pagado') as m, sum(accountreceivables.amountPaid) as montos")).collect{|x| [ x.m, x.montos]}
  	@firstMountAmountInvoicedvsPaid = Constant.joins(:accountreceivables).where("accountreceivables.month = ?", @firstMonth).select("('Monto Facturado') as m, sum(constants.amount) as montos").union(Constant.joins(:accountreceivables).group(:paid).where('accountreceivables.paid = "si" and accountreceivables.month = ?', @firstMonth).select("('Monto Pagado') as m, sum(accountreceivables.amountPaid) as montos")).collect{|x| [ x.m, x.montos]}
  	#b.
  	@historicalAmountInvoicedvsPaid = Constant.joins(:accountreceivables).select("('Monto Facturado') as m, sum(constants.amount) as montos").union(Constant.joins(:accountreceivables).group(:paid).where('accountreceivables.paid = "si"').select("('Monto Pagado') as m, sum(accountreceivables.amountPaid) as montos")).collect{|x| [ x.m, x.montos]}
  	#c.
  	@presentMountAmountInvoicedvsPaid = Constant.joins(:accountreceivables).where("accountreceivables.month = ?", @presentMonth).select("('Monto Facturado') as m, sum(constants.amount) as montos").union(Constant.joins(:accountreceivables).group(:paid).where('accountreceivables.paid = "si" and accountreceivables.month = ?', @presentMonth).select("('Monto Pagado') as m, sum(accountreceivables.amountPaid) as montos")).collect{|x| [ x.m, x.montos]}

  	
  	Constant.joins(:accountreceivables).group(:paid).where('accountreceivables.paid = "si" and accountreceivables.month = ?', @presentMonth).select("('Monto Pagado') as m, sum(accountreceivables.amountPaid) as montos").collect{|x| [ x.m, x.montos]}

  	#falta obtener el top
  	#d. Top clientes deudores (por monto adeudado).
  	#falta buscar la manera de invertir las baras
  	@topDebtorsbyAmount = Client.joins("left join accountreceivables on clients.id = accountreceivables.client_id").group("clients.id, accountreceivables.client_id").where('accountreceivables.accountBalance > 0').select("clients.*, (sum(accountreceivables.accountBalance)) as cuenta_accountreceivables").order('cuenta_accountreceivables DESC').limit(10).collect{|x| [x.name, x.cuenta_accountreceivables ]}


  	#e. Top clientes deudores (por meses adeudados)
  	@topDebtorsbyMonth = Client.joins("left join accountreceivables on clients.id = accountreceivables.client_id").group("clients.id, accountreceivables.client_id").where('accountreceivables.paid = "no"').select("clients.*, count(accountreceivables.month) as cuenta_accountreceivables").order('cuenta_accountreceivables DESC').limit(10).collect{|x| [x.name, x.cuenta_accountreceivables]}

  	


  	#f. Instalaciones
  	@install = Constant.joins(:accountreceivables).group("constants.id, accountreceivables.constant_id").where('constants.name = "Instalación"').select("constants.*, count(accountreceivables.id) as instalaciones").collect{|x| [x.name, x.instalaciones]}
  
  	#Cantidad de cuentas por clientes
  	@accountreceivables_count = Client.joins("left join accountreceivables on clients.id = accountreceivables.client_id").group("clients.id, accountreceivables.client_id").select("clients.*, count(accountreceivables.id) as cuenta_accountreceivables").collect{|x| [x.name, x.cuenta_accountreceivables]}
  	#Cantidad de cuentas por status
  	@accountreceivables_type = Accountreceivable.group(:status).select("accountreceivables.*, count(accountreceivables.id) as estatus").collect{|x| [x.status + " " + (ActionController::Base.helpers.number_with_precision((((x.estatus).to_f * 100.00)/(Accountreceivable.where("accountreceivables.status IS NOT NULL").count).to_f), :precision => 2)).to_s + "%", x.estatus]}
  	#Cantidad de cuentas por tipo de Pago
  	@accountreceivablesConstantsPercentage = Constant.joins(:accountreceivables).group("constants.id, accountreceivables.constant_id").select("constants.name, count(accountreceivables.id) as instalaciones").collect{|x| [x.name  + " " +(ActionController::Base.helpers.number_with_precision((((x.instalaciones).to_f * 100.00)/(Constant.joins(:accountreceivables).count).to_f), :precision => 2)).to_s + "%", x.instalaciones]}

  	@prueba = User.group_by_day(:created_at, range: 2.weeks.ago.midnight..Time.now).count

  	
  	#Monto facturado
  	Constant.joins(:accountreceivables).select("('Monto Facturado') as m, sum(constants.amount) as montos").collect{|x| [ x.m, x.montos]}

  	#monto pagado
  	Constant.joins(:accountreceivables).group(:paid).where('accountreceivables.paid = "si"').select("('Monto Pagado') as m, sum(accountreceivables.amountPaid) as montos").collect{|x| [ x.m, x.montos]}


 
  	
  	



  end
end

#SELECT clients.*, count(accountreceivables.id) as cuenta_accountreceivables FROM "clients" left join accountreceivables on clients.id = accountreceivables.client_id GROUP BY clients.id, accountreceivables.client_id

#clientes con balances positivos o negativos
#Client.joins("left join accountreceivables on clients.id = accountreceivables.client_id").group("clients.id, accountreceivables.client_id").where('accountreceivables.accountBalance > 0').select("clients.*, count(accountreceivables.id) as cuenta_accountreceivables").collect{|x| [x.name, x.cuenta_accountreceivables]}


#c = Client.joins("left join accountreceivables on clients.id = accountreceivables.client_id").group("clients.id, accountreceivables.client_id").where('accountreceivables.accountBalance < 0').oder(: :desc).select("clients.*, sum(accountreceivables.accountBalance) as cuenta_accountreceivables").collect{|x| [x.name, x.cuenta_accountreceivables]}
