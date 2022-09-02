# frozen_string_literal: true

class CreateEntities < ActiveRecord::Migration[6.1]
  def change
    create_table :entities do |t|
      t.string :body, null: false
      t.integer :etype, default: 0

      t.timestamps
    end
  end
end
