class ResidencesController < ApplicationController
  def new
    @residence= Residence.new
  end

  def show
    @residence=Residence.find(params[:id])
  end

  def index 
    @residences= Residence.all
  end

  def default
  end

  def update
    @residence=Residence.find(params[:id])

    if @residence.present?
      flash[:notice] = 'La residencia ya existe'
      render :edit
    else
      if @residence.update(params.require(:residence).permit(:name,:country,:address,:capacity,:photo))
        redirect_to residences_path
      else
        render :edit
      end
    end
  end

  def destroy
    residence=Residence.find(params[:id])

    if residence.destroy
      redirect_to residences_path, notice: "La Residencia '#{residence.name}' ha sido eliminada"
    else
      redirect_to residences_path, notice: "Error al eliminar la Residencia '#{residence.name}'"
    end
  end

  def edit
    @residence=Residence.find(params[:id])
  end

  def create
    @residence=Residence.new(params.require(:residence).permit(:name,:country,:address,:capacity,:photo))

    if @residence.present?
      flash[:notice] = 'La residencia ya existe'
      render :new
    else
      if @residence.save
        redirect_to residences_path
      else
        render :new
      end
    end
  end
end
