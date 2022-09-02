# frozen_string_literal: true

module EntitiesHelper
  def entity_formatted(entity)
    tag.span class: entity.etype.downcase.to_s do
      concat tag.span entity.body
      concat tag.span entity.etype, class: "etype"
    end
  end
end
