# frozen_string_literal: true

class EntitiesController < ApplicationController
  before_action :set_sentence
  before_action :set_resource, only: [:edit, :update, :destroy]

  def new
    @resource = @sentence.entities.new
  end

  def create
    @resource = @sentence.entities.new(resource_params)
    @resource.body = params[:entity][:body].reject(&:empty?).join(" ")

    if @resource.save
      redirect_to new_sentence_entity_path([@sentence]), notice: "Entity created"
    end
  end

  def edit; end
  def update; end
  def destroy; end

  private

  def set_resource
    @resource = Entity.find(params[:id])
  end

  def set_sentence
    @sentence = Sentence.find(params[:sentence_id])
  end

  def resource_params
    accessible = [:body, :etype, :sentence_id]
    params.require(:entity).permit(accessible)
  end
end
