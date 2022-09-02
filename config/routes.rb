# frozen_string_literal: true

Rails.application.routes.draw do
  resources :sentences do
    resources :entities, only: [:new, :edit, :create, :update, :destroy]
  end

  root "sentences#index"
end
