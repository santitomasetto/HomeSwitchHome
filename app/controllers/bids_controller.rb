class BidsController < ApplicationController

	def new
		user_id=params[:user]
		auction_id=params[:auction]
		@bid=Bid.new(user_id: user_id, auction_id: auction_id)
	end

	def create
		@bid=Bid.new(params.require(:bid).permit(:amount, :user_id, :auction_id))
		if @bid.save
			flash.notice="La puja se registro exitosamente"
			redirect_to auctions_path
		else
			flash.alert("ERROR al registrar la puja")
			render :new
		end
	end
end
