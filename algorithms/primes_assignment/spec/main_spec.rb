require_relative './spec_helper'
require 'byebug'

RSpec.describe "integration" do
  describe "Problem#1" do
    it "has sum primes under 10 must be 17" do
      prime = MyPrimes.new(10).primes.inject(:+)
      expect(prime).to eq 17
    end

    it "has sum primes under 100 must be 1060" do
      prime = MyPrimes.new(100).primes.inject(:+)
      expect(prime).to eq 1060
    end

    it "has sum primes under 2000000 must be 142913828922" do
      prime = MyPrimes.new(2000000).primes.inject(:+)
      expect(prime).to eq 142913828922
    end
  end

  describe "Problem#2" do
    it "has a prime which is sum of consecutive primes under 100 " do
      prime = Problem2.new(100).prime_under_max_has_most_cons_primes
      expect(prime).to eq 41
    end

    it "has a prime which is sum of consecutive primes under 1000 " do
      prime = Problem2.new(1000).prime_under_max_has_most_cons_primes
      expect(prime).to eq 953
    end

    it "has a prime which is sum of consecutive primes under 10000 " do
      prime = Problem2.new(10000).prime_under_max_has_most_cons_primes
      expect(prime).to eq 9521
    end

    it "has a prime which is sum of consecutive primes under 100000 " do
      prime = Problem2.new(100000).prime_under_max_has_most_cons_primes
      expect(prime).to eq 92951
    end

    it "has a prime which is sum of consecutive primes under 1000000 must be 997651" do
      prime = Problem2.new(1000000).prime_under_max_has_most_cons_primes
      expect(prime).to eq 997651
    end
  end
end