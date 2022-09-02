# frozen_string_literal: true

require "rails_helper"

RSpec.describe Sentence, type: :model do
  let(:sentence) { create(:sentence) }

  describe "Validations" do
    it { is_expected.to validate_presence_of(:content) }
  end

  describe "Associations" do
    it { is_expected.to have_many(:entities).dependent(:destroy) }
  end

  describe "#with_entities?" do
    subject(:sentence_entified) { sentence.with_entities? }

    context "when sentences does not have entities" do
      it "returns false" do
        expect(sentence_entified).to be(false)
      end
    end

    context "when sentences has entities" do
      before do
        sentence.entities.create(body: "Adidas", etype: "gpe")
        sentence.entities.create(body: "Nike", etype: "gpe")
      end

      it "returns true" do
        expect(sentence_entified).to be(true)
      end
    end
  end

  describe "#words" do
    let(:words_with_exception) { sentence.words(except: true) }
    let(:words_without_exception) { sentence.words(except: false) }

    context "when sentence does not have entities" do
      it "returns array of all words" do
        expect(words_without_exception).to contain_exactly("$100", "Adidas", "Nike", "USA", "buy", "dollars", "for", "in", "to", "wants")
      end
    end

    context "when sentence has entities" do
      before do
        sentence.entities.create(body: "Adidas", etype: "gpe")
        sentence.entities.create(body: "Nike", etype: "gpe")
      end

      it "returns array of words except those that are saved to entities" do
        expect(words_with_exception).to contain_exactly("$100", "USA", "buy", "dollars", "for", "in", "to", "wants")
      end
    end
  end
end
