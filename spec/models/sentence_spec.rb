# frozen_string_literal: true

require "rails_helper"

RSpec.describe Sentence, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:content) }
  end

  context "when using associations" do
    it { is_expected.to have_many(:entities).dependent(:destroy) }
  end
end
