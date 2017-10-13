class PrincipalController < ApplicationController
	before_action :authenticate_user!
  def index
  	if (current_user.role != "client")
      	redirect_to clients_path
    else
    	redirect_to accountreceivables_path
    end
  end
end
