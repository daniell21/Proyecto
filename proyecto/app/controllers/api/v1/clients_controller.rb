module Api
  module V1
    class ClientsController < ApplicationController
      before_filter :restrict_access
      respond_to :json
      
      def index
        respond_with Client.all
      end
      
      def show
      	
        respond_with Client.find_by localId: params[:id]
      end
      
      def create
        respond_with Client.create(params[:client])
      end
      
      def update
        respond_with Client.update(params[:id], params[:clients])
      end
      
      def destroy
        respond_with Client.destroy(params[:id])
      end
      private
      def restrict_access
        authenticate_or_request_with_http_token do |token, options|
        ApiKey.exists?(access_token: token)
      end
    end
    end
  end
end