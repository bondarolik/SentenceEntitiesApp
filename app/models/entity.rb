# frozen_string_literal: true

class Entity < ApplicationRecord
  belongs_to :sentence

  enum etype: { org: 0, gpe: 1, money: 2, theme: 3, time: 4 }
end
