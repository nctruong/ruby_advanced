require_relative '../config/configuration.rb'
require_relative 'spec_helper.rb'

RSpec::Expectations.configuration.on_potential_false_positives = :nothing

RSpec.describe 'Arguments' do
  describe 'Invalid Case is due to incorrect arguments' do
    it 'incorrect file paths' do
      expect {
        Mavericks::Transaction.new('abc', 'xyz')
      }.to raise_error
    end

    it 'people file is incorrect' do
      expect {
        Mavericks::Transaction.new('people_sample.txt', 'transaction.txt')
      }.to raise_error
    end

    it 'transaction file is incorrect' do
      expect {
        Mavericks::Transaction.new('people.txt', 'transaction_sample.txt')
      }.to raise_error
    end
  end

  describe 'Valid Cases' do
    it 'both people and transaction files are correct' do
      expect {
        Mavericks::Transaction.new('people.txt', 'transaction.txt')
      }.not_to raise_error
    end

    it 'getting results' do
      expect {
        solution = Mavericks::Transaction.new('people.txt', 'transaction.txt')
        solution.results
      }.not_to raise_error
    end
  end
end

RSpec.describe 'Private Methods' do
  before (:all) do
    @solution = Mavericks::Transaction.new('people.txt', 'transaction.txt')
  end

  describe 'private methods' do
    it 'list_of_people' do
      expect {
        @solution.instance_eval { list_of_people }
      }.not_to raise_error
    end

    it 'all_paid?' do
      expect {
        @solution.instance_eval { all_paid? }
      }.not_to raise_error
    end

    it 'people_not_paid' do
      expect {
        @solution.instance_eval { people_not_paid }
      }.not_to raise_error
    end

    it 'list_of_amount' do
      expect {
        @solution.instance_eval { list_of_amount }
      }.not_to raise_error
    end

    it 'array_of_lines' do
      expect {
        @solution.instance_eval { array_of_lines(self.people_path) }
      }.not_to raise_error
    end

    it 'average_amount' do
      expect {
        @solution.instance_eval { average_amount }
      }.not_to raise_error
    end

    it 'paid_balance' do
      expect {
        @solution.instance_eval { paid_balance }
      }.not_to raise_error
    end

    it 'separating_positive_negative' do
      expect {
        @solution.instance_eval { separating_positive_negative }
      }.not_to raise_error
    end
  end
end

