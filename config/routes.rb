# frozen_string_literal: true

Rails.application.routes.draw do
  resources :sentences

  root "sentences#index"
end
