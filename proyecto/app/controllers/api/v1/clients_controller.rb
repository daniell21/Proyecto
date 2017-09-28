module Api
  module V1
    class ClientsController < ApplicationController
 
      respond_to :json
      
      def index
        respond_with Client.all
      end
      
      def show
      	
        respond_with Client.find_by localId: params[:id]
      end
      
      # def create
      #   respond_with Client.create(params[:client])
      # end
      
      def update
        respond_with Client.update(params[:id], params[:clients])
      end
      
      def destroy
        respond_with Client.destroy(params[:id])
      end
      
    end
  end
end