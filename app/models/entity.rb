# frozen_string_literal: true

class Entity < ApplicationRecord
  enum etype: { org: 0, gpe: 1, money: 2, theme: 3, time: 4 }

  belongs_to :sentence, touch: true

  validates :body, presence: true
end
