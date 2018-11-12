class SubastasController < ApplicationController
  def index 
  	@subastas= Subasta.all
  end

  def default
  end
  
  def new
  	@subasta= Subasta.new
  end

  def show
  	@subasta= Subasta.find(params[:id])
  end

  def update
  end

  def destroy
  	subasta= Subasta.find(params[:id])
  	if subasta.destroy
  		redirect_to subastas_path, notice: "la subasta #{subasta.nombre} ha sido eliminada"
  	else
  		redirect_to subastas_path, notice: "ERROR al eliminar la subasta #{subasta.nombre}"
  	end
  end

  def edit
  end
  

  def create
  	@subasta= Subasta.new(params.require(:subasta).permit(:nombre, :monto))
    if @subasta.save 
      redirect_to subastas_path
    end
  end

  def listaresidencias
  	@residencias= Residencias.all
  end

end
