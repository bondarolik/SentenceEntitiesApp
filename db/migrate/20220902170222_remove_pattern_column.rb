# frozen_string_literal: true

class RemovePatternColumn < ActiveRecord::Migration[6.1]
  def change
    remove_column :sentences, :pattern, :text
  end
end
