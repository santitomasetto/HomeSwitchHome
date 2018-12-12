class ResidencesController < ApplicationController
  def new
    @residence= Residence.new
  end

  def show
    @residence=Residence.find(params[:id])
  end

  def index 
    if params[:date1].present? && params[:date2].present?
      if "%#{params[:date1]}%".to_date > Date.today+6.months
        if "%#{params[:date2]}%".to_date.day > "%#{params[:date1]}%".to_date.day && "%#{params[:date2]}%".to_date < "%#{params[:date1]}%".to_date+2.months 
          search1 = "%#{params[:text]}%" 
  	      search2 = "%#{params[:date1]}%"
          search3 = "%#{params[:date2]}%"
          num = ("%#{params[:date2]}%".to_date - "%#{params[:date1]}%".to_date).to_f/7
  		    @residences = Residence.where('name LIKE ? OR country LIKE ?',search1,search1).select {|res| res.is_available?(search2,search3,num)}
        else
          flash.alert = "La diferencia entre fechas debe ser como maximo de 2 meses y como minimo de 1 dia"
          redirect_to residences_path
        end
      else
        flash.alert = "La fecha tiene que ser dentro de 6 meses"
        redirect_to residences_path
      end
  	else
    	@residences= Residence.all
    end
  end

  def default
  end

  def update
    @residence=Residence.find(params[:id])

      if @residence.update(params.require(:residence).permit(:name,:country,:address,:capacity,:photo))
        redirect_to residences_path
      else
        flash.now[:alert] = 'La residencia ya existe'
        render :edit
      end
  end

  def destroy
    residence=Residence.find(params[:id])

    if residence.destroy
      flash.notice = "La Residencia '#{residence.name}' ha sido eliminada"
      redirect_to residences_path
    else
      flash.alert = "Error al eliminar la Residencia '#{residence.name}'"
      redirect_to residences_path
    end
  end

  def edit
    @residence=Residence.find(params[:id])
  end

  def create
    @residence=Residence.new(params.require(:residence).permit(:name,:country,:address,:capacity,:photo))

      if @residence.save
        redirect_to residences_path
      else
        flash.now[:alert] = 'La residencia ya existe'
        render :new
      end
    
  end
end
