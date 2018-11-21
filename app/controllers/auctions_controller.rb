class AuctionsController < ApplicationController
  def index 
  	@auctions= Auction.all
  end

  def default
  end
  
  def new
    r=Residence.find(params[:residence])
    residence_id=r.id
  	@auction= Auction.new(residence_id: residence_id, bid: 0)
  end

  def show
  	@auction= Auction.find(params[:id])
  end

  def update
    @auction = Auction.find(params[:id])
    if @auction.in_date.wday == 1 and @auction.out_date.wday == 0
      if (@auction.in_date.month - Time.now.month) + 12 * (@auction.in_date.year - Time.now.year) >= 6
        if @auction.update(params.require(:auction).permit(:amount,:in_date,:out_date,:bid,:residence_id))
          redirect_to auctions_path
        else
          render :edit
        end
      else
        redirect_to auctions_path, alert: "Se debe crear con 6 meses de anticipacion"
      end    
    else
       redirect_to auctions_path, alert: "La subasta debe comenzar un lunes y terminar un domingo"
    end
  end

  def destroy
  	auction= Auction.find(params[:id])
  	if auction.destroy
  		redirect_to auctions_path, notice: "la subasta '#{auction.residence.name}' ha sido eliminada"
  	else
  		redirect_to auctions_path, alert: "ERROR al eliminar la subasta '#{auction.residence.name}'"
  	end
  end

  def edit
    @auction=Auction.find(params[:id])
  end

  def bid_up
    @auction=Auction.find(params[:auction])
  end

  def create
    @auction= Auction.new(params.require(:auction).permit(:amount,:in_date,:out_date,:bid,:residence_id))

    if @auction.in_date.wday == 1 and @auction.out_date.wday == 0
      if (@auction.in_date.month - Time.now.month) + 12 * (@auction.in_date.year - Time.now.year) >= 6
        if @auction.save 
          redirect_to auctions_path, notice: "La subasta se creo exitosamente"
        else  
          redirect_to auctions_path, alert: "Ya existe la subasta"
        end
      else
        redirect_to auctions_path, alert: "Se debe crear con 6 meses de anticipacion"
      end    
    else
       redirect_to auctions_path, alert: "La subasta debe comenzar un lunes y terminar un domingo"
    end
  end

end