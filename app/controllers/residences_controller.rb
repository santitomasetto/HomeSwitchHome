class ResidencesController < ApplicationController
  def new
    @residence= Residence.new
  end

  def show
    @residence=Residence.find(params[:id])
  end

  def index 
  	search = "%#{params[:keyword]}%"
  	if params[:keyword].present?
  		@residences = Residence.where('name LIKE ? OR country LIKE ?',search,search)
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
