# frozen_string_literal: true

class SentencesController < ApplicationController
  include DryController

  private

  def resource_params
    accessible = [:content, :pattern]
    params.require(:sentence).permit(accessible)
  end
end
