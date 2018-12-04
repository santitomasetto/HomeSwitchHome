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
    @a = Auction.new(params.require(:auction).permit(:in_date))
    if @a.in_date.wday == 1
        if (@a.in_date.month - Time.now.month) + 12 * (@a.in_date.year - Time.now.year) >= 6
          if @auction.update(params.require(:auction).permit(:amount,:in_date,:bid))
            flash.notice = "La subasta #{@auction.residence.name} ha sido actualizada"
            redirect_to auctions_path
          else
            render :edit
          end
        else
          flash.now[:alert] = 'Se debe crear con 6 meses de anticipacion'
          render :new
        end     
    else
      flash.now[:alert] = 'La subasta debe comenzar un lunes'
      render :new
    end
  end

  def destroy
  	auction= Auction.find(params[:id])
  	if auction.destroy
      flash.notice = "La subasta '#{auction.residence.name}' ha sido eliminada"
  		redirect_to auctions_path
  	else
      flash.alert = "ERROR al eliminar la subasta '#{auction.residence.name}'"
  		redirect_to auctions_path 
  	end
  end

  def edit
    @auction=Auction.find(params[:id])
  end

  def bid_up
    @auction=Auction.find(params[:auction])
  end

  def create
    @auction= Auction.new(params.require(:auction).permit(:amount,:in_date,:bid,:residence_id))

    if @auction.in_date.wday == 1 
        if (@auction.in_date.month - Time.now.month) + 12 * (@auction.in_date.year - Time.now.year) >= 6
          if @auction.save 
            flash.notice = "La subasta se creo exitosamente"
            redirect_to auctions_path
          else  
            flash.now[:alert] = 'Ya existe la subasta'
            redirect_to auctions_path
          end
        else
          flash.now[:alert] = 'Se debe crear con 6 meses de anticipacion'
          render :new
        end     
    else
      flash.now[:alert] = 'La subasta debe comenzar un lunes'
      render :new
    end
  end

end