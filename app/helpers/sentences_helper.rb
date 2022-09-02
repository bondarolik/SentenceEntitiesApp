# frozen_string_literal: true

module SentencesHelper
  def formatted_pattern(sentence)
    pattern = sentence.content

    sentence.entities.each do |entity|
      pattern.gsub!(entity.body, entity_formatted(entity))
    end

    pattern
  end
end
