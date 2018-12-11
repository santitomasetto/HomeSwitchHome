class ReservationsController < ApplicationController
  def new
    r=Residence.find(params[:residence])
    residence_id=r.id
    @reservation=Reservation.new(residence_id: residence_id, user_id: current_user.id)
  end

  def show
    
  end

  def index 
    @reservations=User.find(params[:id]).reservations
  end

  def default
  end

  def update
    
  end

  def destroy
    
  end

  def edit
    
  end

  def create
    @reservation= Reservation.new(params.require(:reservation).permit(:in_date, :user_id, :residence_id))
    @cumple=true
    @reservation.residence.auctions.each do |a|
    	if a.in_date == @reservation.in_date
    		@cumple=false
    	end
    end
    if @cumple
    	if Reservation.where(user_id: @reservation.user_id).count < 2
   		  if @reservation.in_date.wday == 1 
    	      if (@reservation.in_date.month - Time.now.month) + 12 * (@reservation.in_date.year - Time.now.year) >= 6
    	        if @reservation.save 
    	          flash.notice = "La reservacion se realizo exitosamente"
    	          redirect_to root_path
    	        else  
    	          flash.alert = "La fecha ya esta reservada"
    	          redirect_to root_path
    	        end
    	      else
    	        flash.now[:alert] = 'Se debe crear con 6 meses de anticipacion'
    	        render :new
    	      end     
    	  else
    	    flash.now[:alert] = 'La subasta deeb comenzar un lunes'
    	    render :new
    	  end
    	else
    		flash.now[:alert] = 'Exediste la cantidad de semanas disponibles'
    		render :new
    	end
    else
    	flash.now[:alert] = 'La residencia se encuentra en subasta esa semana'
    	render :new
  	end
  end

  def create_hotsale
    @user_id=params[:user_id]
    @residence_id=params[:residence_id]
    @in_date=params[:in_date]
    puts @user_id
    puts @residence_id
    puts @in_date
    if !(User.find(@user_id).reservations.where(in_date: @in_date).any?)
      @reservation=Reservation.new(in_date: @in_date, user_id: @user_id, residence_id: @residence_id)
      if @reservation.save
        flash.notice = "La reservacion fue realizada con exito"
        redirect_to hotsales_path
      else
        flash.alert = "Error al realizar la reservacion"
        redirect_to hotsale_path(params[:hotsale_id])
      end
    else
        flash.alert = "Ya posee una reservacion para esa fecha"
        redirect_to hotsale_path(params[:hotsale_id])  
    end
  end
end
