class GraphsController < ApplicationController
  def index
  	@accountreceivables_count = Client.joins(:accountreceivables).group("clients.id, accountreceivables.client_id").select("clients.*, count(accountreceivables.id) as cuenta_accountreceivables").collect{|x| [x.name, x.cuenta_accountreceivables]}
  	@accountreceivables_type = Accountreceivable.group(:status).count
  	@prueba = User.group_by_day(:created_at, range: 2.weeks.ago.midnight..Time.now).count
  end
end
