class UsersController < ApplicationController

	def new
		@user=User.new
	end

	def create
		@user=User.new(params.require(:user).permit(:name,:mail,:birthdate,:password,:card_number,:card_security_number,:card_vto,:premium))
      if Time.now.year-@user.birthdate.year >=18
      	if (@user.card_vto.month - Time.now.month) + 12 * (@user.card_vto.year - Time.now.year) > 0
      	  if @user.save
      	  	flash.notice = "El usuario  '#{@user.name}' fue creado con exito"
      	  	redirect_to residences_path
      	  else
      	  	flash.now[:alert] = 'El usuario ya existe'
      	  	render :new
     	  end
      	else
      	  flash.now[:alert] = 'Tu tarjeta esta vencida'
      	  render :new
      	end
      else
      	flash.now[:alert] = 'Tenes que ser mayor de 18'
      	render :new	
      end
	end
	
	def index
	end

	def show
	end

	def destroy
	end

	def edit
	end

	def update
	end

end
