class ResidenciasController < ApplicationController
  def index 
  end

  def default
  end
  
  def new
    @residencia= Residencia.new
  end

  def show
    @residencia=Residencia.find(params[:id])
  end

  def update
  end

  def destroy
    Residencia.destroy(params[:id])
    redirect_to residencia_path
  end

  def edit
  end

  def create
    @residencia = Residencia.create(params.require(:residencia))
    redirect_to @residencia
  end

end
