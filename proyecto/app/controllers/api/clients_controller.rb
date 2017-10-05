class Api::ClientsController < ApplicationController

	#before_action :doorkeeper_authorize!
	acts_as_token_authentication_handler_for User
	def index
		@clients = Client.all
	end
end