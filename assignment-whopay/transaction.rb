# author: Will Nguyen
# ruby version: 2.3.3
require 'byebug'

class Transaction
  attr_accessor :people_path, :transaction_path
  attr_accessor :people, :paid_infos

  def initialize(people_path, transaction_path)
    @people_path      = people_path
    @transaction_path = transaction_path
    @people           = list_of_people
    @paid_infos       = list_of_amount
    # byebug
    people_not_paid&.each do |name|
      @paid_infos[name] = 0
    end
  rescue => e
    raise e.to_s
  end

  def results
    result = ""
    positive_amounts, negative_amounts = separating_positive_negative

    p_idx = n_idx = 0
    loop {
      break if negative_amounts[n_idx].nil? || positive_amounts[p_idx].nil?

      positive_amount = positive_amounts[p_idx]
      negative_amount = negative_amounts[n_idx]
      p_name = positive_amount[0]
      p_val  = positive_amount[1]
      n_name = negative_amount[0]
      n_val  = negative_amount[1]

      paid = (p_val + negative_amount[1]).round(2)
      # byebug
      need_paid = 0
      if paid > 0
        # Paid not enough => next person pays
        negative_amounts[n_idx][1] = 0
        positive_amounts[p_idx][1] = paid
        need_paid = n_val.abs
        n_idx += 1
      else
        if paid == 0
          negative_amounts[n_idx][1] = positive_amounts[p_idx][1] = 0
          need_paid = p_val
          p_idx += 1
          n_idx += 1
        else
          # Enough to pays => same person continue to pays
          negative_amounts[n_idx][1] = paid
          positive_amounts[p_idx][1] = 0
          need_paid = p_val
          p_idx += 1
        end
      end
      result << "#{n_name} pays $#{need_paid.round(2)} to #{p_name}.\n"
    }
    result
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
    lines  = array_of_lines(transaction_path)
    lines.each_with_object(Hash.new(0.00)) do |line, result|
      name = line.split(" ").first
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
  rescue => e
    raise e.to_s
  end

  # Return average amount of total paid amount
  def average_amount
    (paid_infos&.values.inject(:+)/paid_infos.size).round(2)
  end

  # Comparing with average amount to get balance for each people
  def paid_balance
    average = average_amount
    paid_infos.each do |k,v|
      paid_infos[k] = v - average
    end
  end

  def separating_positive_negative
    positive_amounts = paid_balance.select{|k,v| v > 0}.sort{|(k1,v1),(k2,v2)| v1 <=> v2 }.reverse
    negative_amounts = paid_balance.select{|k,v| v < 0}.sort{|(k1,v1),(k2,v2)| v1 <=> v2 }
    return positive_amounts, negative_amounts
  end
end