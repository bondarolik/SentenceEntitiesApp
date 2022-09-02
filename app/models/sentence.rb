# frozen_string_literal: true

class Sentence < ApplicationRecord
  has_many :entities, dependent: :destroy

  validates :content, presence: true

  def words
    content.split(%r{[\s/,/-]}).reject(&:empty?)
  end

  def entified?
    entities.any?
  end
end
