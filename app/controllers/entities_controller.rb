# frozen_string_literal: true

class EntitiesController < ApplicationController
  include DryController
  before_action :set_sentence

  def new
    super
    @resource = @sentence.entities.new
  end

  private

  def set_sentence
    @sentence = Sentence.find(params[:sentence_id])
  end

  def resource_params
    accessible = [:body, :etype, :sentence_id]
    params.require(:sentence).permit(accessible)
  end
end
