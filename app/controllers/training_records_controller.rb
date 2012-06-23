class TrainingRecordsController < ApplicationController
  def create
    @athlet = Athlet.find(params[:athlet_id])
    @training_record = @athlet.training_records.create(params[:training_record])
    redirect_to athlet_path(@athlet)
  end
end
