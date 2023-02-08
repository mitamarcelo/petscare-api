class ProceduresController < ApplicationController
  include PetsConcern
  before_action :authenticate_user!
  before_action :set_pet
  before_action :set_procedure_record, only: %i[show update destroy]

  def index
    @procedure_records = current_pet.procedure_records
    render 'procedure_records/index'
  end

  def show
    render 'procedure_records/show'
  end

  def create
    @procedure_record = ProcedureRecord.create!(procedure_params.merge(pet: current_pet))
    render 'procedure_records/show', status: :created
  end

  def update
    @procedure_record.update!(procedure_params)
    render 'procedure_records/show'
  end

  def destroy
    @procedure_record.destroy!
    head :no_content
  end

  def categories
    @procedure_record_categories = ProcedureRecord.categories
    render 'procedure_records/categories'
  end

  private

  def procedure_params
    params.require(:procedure).permit(:title, :category, :description, :procedure_on, :next_procedure_date)
  end

  def set_procedure_record
    @procedure_record = current_pet.procedure_records.find(params[:id])
  end
end
