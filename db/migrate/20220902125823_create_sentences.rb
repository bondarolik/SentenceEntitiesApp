# frozen_string_literal: true

class CreateSentences < ActiveRecord::Migration[6.1]
  def change
    create_table :sentences do |t|
      t.text :content, null: false
      t.text :pattern

      t.timestamps
    end
  end
end
