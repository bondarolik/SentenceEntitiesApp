# frozen_string_literal: true

module EntitiesHelper
  def entity_formatted(entity)
    tag.span class: entity.etype.downcase.to_s do
      "#{entity.body} <span class='etype'>#{entity.etype}</span>".html_safe
    end
  end
end
