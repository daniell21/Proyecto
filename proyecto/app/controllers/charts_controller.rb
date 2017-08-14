class ChartsController < ApplicationController
  def index
  	@accountreceivables_count = Client.joins(:accountreceivables).group("clients.id, accountreceivables.client_id").select("clients.*, count(accountreceivables.id) as cuenta_accountreceivables").collect{|x| [x.name, x.cuenta_accountreceivables]}
  end
end
