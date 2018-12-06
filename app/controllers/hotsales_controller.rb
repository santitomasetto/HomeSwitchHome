class HotsalesController < ApplicationController
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
		@hotsale = Hotsale.find(params[:id])
    	@h = Hotsale.new(params.require(:hotsale).permit(:in_date))
    	if @h.in_date.wday == 1
    		if @h.in_date > Time.now
        		if @hotsale.update(params.require(:hotsale).permit(:amount,:in_date))
            		flash.notice = "El hot-sale #{@hotsale.residence.name} ha sido actualizado"
            		redirect_to hotsales_path
        		else
            		render :edit
            	end
            else 
            	flash.now[:alert] = 'El hot-sale debe comenzar como mínimo mañana'
        		render :edit
        	end    
    	else
        	flash.now[:alert] = 'El hot-sale debe comenzar un lunes'
        	render :edit
    	end
	end

	def create
		@hotsale= Hotsale.new(params.require(:hotsale).permit(:amount,:in_date,:residence_id))

    	if @hotsale.in_date.wday == 1 
    		if @hotsale.in_date > Time.now
        		if @hotsale.save 
            		flash.notice = "El hot-sale se creo exitosamente"
            		redirect_to hotsales_path
        		else  
            		flash.now[:alert] = 'Ya existe el hot-sale'
            		redirect_to hotsales_path
        		end
        	else
        		flash.now[:alert] = 'El hot-sale debe comenzar como mínimo mañana'
        		render :new  
        	end
    	else
    		flash.now[:alert] = 'El hot-sale debe comenzar un lunes'
        	render :new
    	end
	end

	def edit
		@hotsale=Hotsale.find(params[:id])
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
