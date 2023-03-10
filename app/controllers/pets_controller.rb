class PetsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_pet, only: %i[show update destroy]

  def index
    @pets = current_user.pets
    render 'pets/index'
  end

  def show
    render 'pets/show'
  end

  def create
    @pet = Pet.create!(pet_params.merge(user: current_user))
    render 'pets/show', status: :created
  end

  def update
    @pet.update!(pet_params)
    render 'pets/show'
  end

  def destroy
    @pet.destroy!
    head :no_content
  end

  def options
    @genders = Pet.genders.map { |gen| gen[0] }
    @species = Pet.species.map { |spe| spe[0] }
    render 'pets/options'
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :bio, :breed, :species, :gender, :dob)
  end

  def set_pet
    @pet = current_user.pets.find(params[:id])
  end
end
