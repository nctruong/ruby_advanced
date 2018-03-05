# Processing amounts of each person
module Lib
  class Amount
    attr_accessor :negative_amounts, :positive_amounts
    attr_accessor :n_idx, :p_idx, :p_val, :n_name, :p_name,
                  :n_val, :need_paid, :paid
    attr_reader   :result

    def initialize(args)
      @positive_amounts = args[:positive_amounts]
      @negative_amounts = args[:negative_amounts]
      @result           = ''
      @p_idx = @n_idx = 0
      @need_paid = 0
    end

    def run
      loop do
        break if negative_amounts[n_idx].nil? || positive_amounts[p_idx].nil?
        negative_amount, positive_amount = split_positive_negative
        split_info negative_amount, positive_amount
        pay
      end
      result
    end

    private

    def pay
      if paid > 0
        next_person_pays
      else
        paid.zero? ? pay_enough : keep_paying
      end
      result << "#{@n_name} pays $#{need_paid.round(2)} to #{@p_name}.\n"
    end

    def split_positive_negative
      positive_amount = positive_amounts[p_idx]
      negative_amount = negative_amounts[n_idx]
      [negative_amount, positive_amount]
    end

    def split_info(negative_amount, positive_amount)
      @p_name = positive_amount[0]
      @p_val  = positive_amount[1]
      @n_name = negative_amount[0]
      @n_val  = negative_amount[1]
      @paid = (p_val + negative_amount[1]).round(2)
    end

    def next_person_pays
      negative_amounts[n_idx][1] = 0
      positive_amounts[p_idx][1] = paid
      @need_paid = n_val.abs
      @n_idx += 1
    end

    def pay_enough
      negative_amounts[n_idx][1] = positive_amounts[p_idx][1] = 0
      @need_paid = @p_val
      @p_idx += 1
      @n_idx += 1
    end

    def keep_paying
      negative_amounts[n_idx][1] = paid
      positive_amounts[p_idx][1] = 0
      @need_paid = @p_val
      @p_idx += 1
    end
  end
end