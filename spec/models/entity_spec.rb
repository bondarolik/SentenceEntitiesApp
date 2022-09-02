# frozen_string_literal: true

require "rails_helper"

RSpec.describe Entity, type: :model do
  let(:adidas) { create(:entity, body: "Adidas", etype: "org") }
  let(:nike) { create(:entity, body: "Nike", etype: "org") }
  let(:usa) { create(:entity, body: "USA", etype: "gpe") }
  let(:dollars) { create(:entity, body: "$100 dollars", etype: "money") }

  describe "Validations" do
    it { is_expected.to validate_presence_of(:body) }
  end

  describe "Associations" do
    it { is_expected.to belong_to(:sentence) }
  end
end
