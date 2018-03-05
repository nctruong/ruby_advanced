# Processing transaction to get results
module Lib
  # Implementation of Base, Processing transaction
  class Transaction < Base
    attr_accessor :people_path, :transaction_path
    attr_accessor :people, :paid_infos

    def initialize(args)
      @people_path      = args[:people_path]
      @transaction_path = args[:transaction_path]
      @people           = list_of_people
      @paid_infos       = list_of_amount
      # byebug
      people_not_paid.each do |name|
        @paid_infos[name] = 0
      end
    rescue StandardError => e
      raise e
    end

    def results
      positive_amounts, negative_amounts = separating_positive_negative
      amount = Amount.new({negative_amounts: negative_amounts, positive_amounts: positive_amounts})
      amount.run
    end

    private

    # Check if all people paid
    def all_paid?
      people.sort == paid_infos.keys.sort
    end

    # Return an array of people who not paid
    def people_not_paid
      all_paid? ? [] : people - paid_infos.keys
    end

    # Get list people from text file
    def list_of_people
      array_of_lines(people_path)
    end

    # Return hash of name and corresponding paid amount
    def list_of_amount
      lines = array_of_lines(transaction_path)
      lines.each_with_object(Hash.new(0.00)) do |line, result|
        name = line.split(' ').first
        paid = line[/(\d+[.,]\d+)|(\d+)/].to_f.round(2)
        result[name] = result.key?(name) ? (result[name] + paid).round(2) : paid
      end
    end

    def array_of_lines(path)
      lines = []
      File.open(path).each do |line|
        lines << line.strip
      end
      lines
    rescue StandardError => e
      raise e
    end

    # Return average amount of total paid amount
    def average_amount
      (paid_infos.values.inject(:+) / paid_infos.size).round(2)
    end

    # Comparing with average amount to get balance for each people
    def paid_balance
      average = average_amount
      paid_infos.each do |k, v|
        paid_infos[k] = v - average
      end
    end

    def separating_positive_negative
      positive_amounts = paid_balance.select { |_, v| v > 0 }
      positive_amounts = positive_amounts.sort { |(_, v1), (_, v2)| v1 <=> v2 }
      positive_amounts = positive_amounts.reverse

      negative_amounts = paid_balance.select { |_, v| v < 0 }
      negative_amounts = negative_amounts.sort { |(_, v1), (_, v2)| v1 <=> v2 }

      [positive_amounts, negative_amounts]
    end
  end
end
