# frozen_string_literal: true

class EntitiesController < ApplicationController
  include DryController

  private

  def resource_params
    accessible = [:body, :etype, :sentence_id]
    params.require(:sentence).permit(accessible)
  end
end
