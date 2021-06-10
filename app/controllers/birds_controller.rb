class BirdsController < ApplicationController
  def index
    birds = Bird.all
    #render json: @birds

    #render json: birds, only: [:id, :name, :species]    ## Use ONLY for showing multiple hashes, specific attr
    
    ## or
    render json: birds, except: [:created_at, :updated_at]

    #render json: birds.to_json(except: [:created_at, :updated_at]) Whats actually happening 
  end



  def show
    bird = Bird.find_by(id: params[:id])
    #render json: bird 

    #render json: {id: bird.id, name: bird.name, species: bird.species }

    ## or 
    if bird 
      render json: bird.slice(:id, :name, :species)   ## only work for ONE HASH / work for showing ONE
    else 
      render json: { message: 'Bird not found' }
    end 

  end
end