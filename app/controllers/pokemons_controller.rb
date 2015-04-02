class PokemonsController < ApplicationController

def index
	@pokemon = Pokemon.all
end

def update
	capture
end

def capture
  p_id = Pokemon.find(params[:id])
  p_id.trainer_id = current_trainer.id
  p_id.save
  redirect_to root_url
end

def damage
  @pokemon = Pokemon.find(params[:id])
  @pokemon.health -= 10
  @pokemon.save
  if @pokemon.health <= 0
  	@pokemon.destroy
  end
  redirect_to trainer_path(@pokemon.trainer)
end

def new
	#get name from field in views/pokemons/new.html.erb
  p = Pokemon.create level: 1, trainer_id: current_trainer.id, health: 100, name: name
  if p.valid?
    redirect_to trainer_path(@pokemon.trainer)
  else
    redirect_to new_path(current_trainer)
  end
end

end
