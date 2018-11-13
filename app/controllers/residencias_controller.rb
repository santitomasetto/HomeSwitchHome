class ResidenciasController < ApplicationController
  
  def new
    @residencia= Residencia.new
  end

  def show
    @residencia=Residencia.find(params[:id])
  end

  def index 
  end

  def default
  end

  def update
  end

  def destroy
    Residencia.destroy(params[:id])
    redirect_to residencias_path
  end

  def edit
  end

  def create
<<<<<<< HEAD
    @residencia=Residencia.new(params.require(:residencia).permit(:nombre,:pais,:direccion,:capacidad,:foto))

    if @residencia.save
      redirect_to residencias_path
    else
      render :new
    end
=======
>>>>>>> 051cb348633aa37c5163aaf248c1e06d35b099f2
  end

end