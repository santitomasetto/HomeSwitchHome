class AuctionsController < ApplicationController
  def index 
  	@auctions= Auction.all
  end

  def default
  end
  
  def new
    r=Residence.find(params[:residence])
    nombre=r.name
    residence_id=r.id
  	@auction= Auction.new(name: nombre, residence_id: residence_id, bid: 0)
  end

  def show
  	@auction= Auction.find(params[:id])
  end

  def update
    @auction = Auction.find(params[:id])
    if @auction.update(params.require(:auction).permit(:name,:amount,:in_date,:out_date,:bid,:residence_id))
      redirect_to auctions_path
    else
      render :edit
    end
  end

  def destroy
  	auction= Auction.find(params[:id])
  	if auction.destroy
  		redirect_to auctions_path, notice: "la subasta '#{auction.name}' ha sido eliminada"
  	else
  		redirect_to auctions_path, notice: "ERROR al eliminar la subasta '#{auction.name}'"
  	end
  end

  def edit
    @auction=Auction.find(params[:id])
  end

  def bid_up
    @auction=Auction.find(params[:auction])
  end
  

  def create
  	@auction= Auction.new(params.require(:auction).permit(:name,:amount,:in_date,:out_date,:bid,:residence_id))
    if @auction.save 
      redirect_to auctions_path, notice: "La subasta se creo exitosamente"
    else  
      redirect_to :new
    end
    
  end

end