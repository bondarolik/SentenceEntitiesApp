# frozen_string_literal: true

class Sentence < ApplicationRecord
  has_many :entities, dependent: :destroy

  validates :content, presence: true

  def words(except: false)
    result = content

    if except && with_entities?
      entities.pluck(:body).compact.each do |body|
        result.slice! body
      end
    end

    result.split(%r{[\s/,/-]}).reject(&:empty?).sort
  end

  def with_entities?
    entities.any?
  end
end
