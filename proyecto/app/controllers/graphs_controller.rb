class GraphsController < ApplicationController
  def index
  	@accountreceivables_count = Client.joins("left join accountreceivables on clients.id = accountreceivables.client_id").group("clients.id, accountreceivables.client_id").select("clients.*, count(accountreceivables.id) as cuenta_accountreceivables").collect{|x| [x.name, x.cuenta_accountreceivables]}


  	@accountreceivables_type = Accountreceivable.group(:status).select("accountreceivables.*, count(accountreceivables.id) as estatus").collect{|x| [x.status + " " + (ActionController::Base.helpers.number_with_precision((((x.estatus).to_f * 100.00)/(Accountreceivable.where("accountreceivables.status IS NOT NULL").count).to_f), :precision => 2)).to_s + "%", x.estatus]}


  	@prueba = User.group_by_day(:created_at, range: 2.weeks.ago.midnight..Time.now).count
 # 	Client.joins(:accountreceivables).group("clients.id, accountreceivables.client_id").select("clients.*, count(accountreceivables.id) as cuenta_accountreceivables").collect{|x| [x.name, x.cuenta_accountreceivables]}
  	#Accountreceivable.group(:client_id).where('accountreceivables.accountBalance > 0').count
  	#falta obtener el top
  	@topDebtorsbyAmount = Client.joins("left join accountreceivables on clients.id = accountreceivables.client_id").group("clients.id, accountreceivables.client_id").where('accountreceivables.accountBalance < 0').select("clients.*, sum(accountreceivables.accountBalance) as cuenta_accountreceivables").collect{|x| [x.name, x.cuenta_accountreceivables * -1]}
  	#falta obtener el top
  	@topDebtorsbyMonth = Client.joins("left join accountreceivables on clients.id = accountreceivables.client_id").group("clients.id, accountreceivables.client_id").where('accountreceivables.paid = "no"').select("clients.*, count(accountreceivables.month) as cuenta_accountreceivables").collect{|x| [x.name, x.cuenta_accountreceivables]}
  	@install = Constant.joins(:accountreceivables).group("constants.id, accountreceivables.constant_id").where('constants.name = "Instalación"').select("constants.*, count(accountreceivables.id) as instalaciones").collect{|x| [x.name, x.instalaciones]}
  	@accountreceivablesConstantsPercentage = Constant.joins(:accountreceivables).group("constants.id, accountreceivables.constant_id").select("constants.name, count(accountreceivables.id) as instalaciones").collect{|x| [x.name  + " " +(ActionController::Base.helpers.number_with_precision((((x.instalaciones).to_f * 100.00)/(Constant.joins(:accountreceivables).count).to_f), :precision => 2)).to_s + "%", x.instalaciones]}



  end
end

#SELECT clients.*, count(accountreceivables.id) as cuenta_accountreceivables FROM "clients" left join accountreceivables on clients.id = accountreceivables.client_id GROUP BY clients.id, accountreceivables.client_id

#clientes con balances positivos o negativos
#Client.joins("left join accountreceivables on clients.id = accountreceivables.client_id").group("clients.id, accountreceivables.client_id").where('accountreceivables.accountBalance > 0').select("clients.*, count(accountreceivables.id) as cuenta_accountreceivables").collect{|x| [x.name, x.cuenta_accountreceivables]}


#c = Client.joins("left join accountreceivables on clients.id = accountreceivables.client_id").group("clients.id, accountreceivables.client_id").where('accountreceivables.accountBalance < 0').oder(: :desc).select("clients.*, sum(accountreceivables.accountBalance) as cuenta_accountreceivables").collect{|x| [x.name, x.cuenta_accountreceivables]}
