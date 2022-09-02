# frozen_string_literal: true

class Entity < ApplicationRecord
  belongs_to :sentence

  enum :type, [:org, :gpe, :money, :theme, :time]
end
