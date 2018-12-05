class HotsaleController < ApplicationController
	def index
		@hotsales= Hotsale.all
	end

	def new
		r=Residence.find(params[:residence])
    	residence_id=r.id
  		@hotsale= Hotsale.new(residence_id: residence_id)
	end

	def show
		@hotsale= Hotsale.find(params[:id])
	end

	def update
	end

	def create
	end

	def edit
	end

	def destroy
  		hotsale= Hotsale.find(params[:id])
  		if hotsale.destroy
    	  flash.notice = "El hot-sale '#{hotsale.residence.name}' ha sido eliminado"
  		  redirect_to hotsales_path
  		else
    	  	flash.alert = "ERROR al eliminar el hot-sale '#{hotsale.residence.name}'"
  			redirect_to hotsales_path 
  		end
	end
end
