# frozen_string_literal: true

class AddReferenceToEntity < ActiveRecord::Migration[6.1]
  def change
    add_reference :entities, :sentence, index: true
  end
end
