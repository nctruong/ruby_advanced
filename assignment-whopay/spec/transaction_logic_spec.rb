require '../transaction.rb'
require './spec_helper.rb'

RSpec.describe "Transaction: Logic" do
  describe "case#1" do
    it "all people paid" do
      solution = Transaction.new("test_cases/case1/people.txt","test_cases/case1/transaction.txt")
      solution.results.should eq("Alice pays $150.0 to Claire.\nBob pays $50.0 to David.\n")
    end
  end

  describe "case#2" do
    it "Claire not paid" do
      solution = Transaction.new("test_cases/case2/people.txt","test_cases/case2/transaction.txt")
      solution.results.should eq("Claire pays $150.0 to David.\nAlice pays $50.0 to Bob.\n")
    end
  end

  describe "case#3" do
    it "Amount with decimals" do
      solution = Transaction.new("test_cases/case3/people.txt","test_cases/case3/transaction.txt")
      solution.results.should eq("Alice pays $150.15 to Claire.\nBob pays $50.05 to David.\n")
    end
  end

  describe "case#4" do
    it "Mavericks case" do
      solution = Transaction.new("test_cases/case4/people.txt","test_cases/case4/transaction.txt")
      solution.results.should eq("Alice pays $89.31 to David.\nAlice pays $55.96 to Claire.\nAlice pays $33.11 to Bob.\n")
    end
  end
end