# frozen_string_literal: true

class Sentence < ApplicationRecord
  has_many :entities, dependent: :nullify

  validates :content, presence: true

  def words
    content.split(%r{[\s/,/-]}).reject(&:empty?)
  end
end
