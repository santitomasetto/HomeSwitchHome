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
  end

  def update
  end

  def destroy
  end

  def edit
  end

  def create
  end

end
