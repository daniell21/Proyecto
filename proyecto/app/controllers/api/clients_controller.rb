class Api::ClientsController < ApplicationController

	before_action :doorkeeper_authorize!
	def index
		@clients = Client.all
	end
end