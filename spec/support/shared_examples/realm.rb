# frozen_string_literal: true

RSpec.shared_examples "realm" do
  describe "associations" do
    subject { described_class.new(realm: :national) }

    it { is_expected.to belong_to(:locality).optional }
    it { is_expected.to belong_to(:state).optional }
    it { is_expected.to belong_to(:country) }
    it { is_expected.to belong_to(:company).optional }
  end

  describe "defines enum" do
    realms = [:local, :national, :international, :private]

    it { is_expected.to define_enum_for(:realm).with_values(realms).with_suffix.without_scopes }
  end

  describe "indexes" do
    it { is_expected.to have_db_index(:realm) }
  end

  describe "validations" do
    context "when :realm is :local" do
      subject { described_class.new(realm: :local) }

      it { is_expected.not_to validate_presence_of(:locality) }
      it { is_expected.to validate_presence_of(:state) }
      it { is_expected.not_to validate_presence_of(:company) }
    end

    context "when :realm is :national" do
      subject { described_class.new(realm: :national) }

      it { is_expected.not_to validate_presence_of(:locality) }
      it { is_expected.not_to validate_presence_of(:state) }
      it { is_expected.not_to validate_presence_of(:company) }
    end

    context "when :realm is :international" do
      subject { described_class.new(realm: :international) }

      it { is_expected.not_to validate_presence_of(:locality) }
      it { is_expected.not_to validate_presence_of(:state) }
      it { is_expected.not_to validate_presence_of(:company) }
    end

    context "when :realm is :private" do
      subject { described_class.new(realm: :private) }

      it { is_expected.not_to validate_presence_of(:locality) }
      it { is_expected.not_to validate_presence_of(:state) }
      it { is_expected.to validate_presence_of(:company) }
    end
  end

  describe "on :before_save callback" do
    test_cases = {
      local: [:company],
      national: [:company, :locality, :state],
      international: [:company, :locality, :state],
      private: [:locality, :state],
    }

    test_cases.each do |realm_type, method_names|
      context "when :#{realm_type}" do
        method_names.each do |method_name|
          it "sets ##{method_name} to nil" do
            instance = described_class.new(realm: realm_type)
            instance.send "#{method_name}=", build_stubbed(method_name)

            expect { instance.run_callbacks(:save) }.to change(instance, method_name).to(nil)
          end
        end

        # Specific test for :private
        if realm_type == :private
          it "sets #country to #company.country" do
            instance = described_class.new(realm: :private)
            company = build :company
            instance.company = company
            instance.country = build :country

            expect { instance.run_callbacks(:save) }.to change(instance, :country).to(company.country)
          end
        end
      end
    end
  end
end
