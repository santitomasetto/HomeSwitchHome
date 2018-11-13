class AuctionsController < ApplicationController
  def index 
  	@auctions= Auction.all
  end

  def default
  end
  
  def new
  	@auction= Auction.new
  end

  def show
  	@auction= Auction.find(params[:id])
  end

  def update
  end

  def destroy
  	auction= Auction.find(params[:id])
  	if auction.destroy
  		redirect_to auctions_path, notice: "la subasta #{auction.name} ha sido eliminada"
  	else
  		redirect_to auctions_path, notice: "ERROR al eliminar la subasta #{auction.name}"
  	end
  end

  def edit
  end
  

  def create
  	@auction= Auction.new(params.require(:auction).permit(:name, :amount))
    if @auction.save 
      redirect_to auctions_path
    end
  end

end