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
    redirect_to residencia_path
  end

  def edit
  end

  def create
  end

end