# frozen_string_literal: true

class Sentence < ApplicationRecord
  validates :content, presence: true
end
