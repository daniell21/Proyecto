class PrincipalController < ApplicationController
	before_action :authenticate_user!
  def index
  	if (current_user.role == "admin")
      redirect_to clients_path
    end
  end
end
