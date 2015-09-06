class ActorsController < ApplicationController
	def index
		@actors = Actor.all
	end

	def new
		@actor = Actor.new
	end

	def create
		@actor = Actor.new(get_params)
		if @actor.save
			redirect_to actors_path, notice:"El actor #{@actor.name} ha sido creado con exito"
		else
			render :new
		end
	end


	private
	def get_params
		params.require(:actor).permit(:name,:bio,:birth_date,:birth_place,:image_url,:alive,:death_date,:death_place)
	end
end
