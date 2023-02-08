module PetsConcern
  extend ActiveSupport::Concern

  def current_pet
    @pet
  end

  private

  def set_pet
    @pet = current_user.pets.find(params[:pet_id])
  end
end
