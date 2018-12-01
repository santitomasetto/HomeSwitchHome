class ReservationsController < ApplicationController
  def new
    r=Residence.find(params[:residence])
    residence_id=r.id
    @reservation=Reservation.new(residence_id: residence_id, user_id: current_user.id)
  end

  def show
    
  end

  def index 
  	
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
  end
end
