module DateServices
  class Format
    def initialize(date)
      @date = date
    end

    def year_month_day
      @date.strftime('%y%m%d') if @date
    end

    def print_date
      @date.strftime("%B #{@date.day}, %Y") if @date
    end

    def print_abbrev_date
      @date.strftime('%d/%m/%y') if @date
    end

    def print_abbrev_date_time
      @date.strftime('%d/%m/%Y %H:%M') if @date
    end

    def print_hour
      @date.strftime('%l:%M %p') if @date
    end

    def print_datetime
      @date.strftime('%H:%M %d/%m/%Y') if @date
    end

    def print_date_with_weekday
      @date.strftime('%A, %-d %b, %Y') if @date
    end

    def print_weekday_and_day
      @date.strftime('%a %-d') if @date
    end

    def print_weekday_day_and_month_abbr
      @date.strftime('%a, %d %b') if @date
    end

    def print_date_with_abbreviated_weekday
      @date.strftime('%a, %-d %b %Y') if @date
    end

    def print_date_with_abbreviated_full_weekday
      @date.strftime('%A, %-d %b %Y') if @date
    end

    def print_date_with_weekday_abbr
      @date.strftime('%d %b, %a') if @date
    end

    def print_abbrev_month_and_year
      @date.strftime('%b %y') if @date
    end

    def print_full_month_and_year
      @date.strftime('%m/%Y') if @date
    end

    def print_date_with_time
      @date.strftime('%Y-%m-%d %H:%M') if @date
    end

    def print_date_with_full_time
      @date.strftime('%d/%m/%Y %H:%m:%S') if @date
    end

    def print_12_hour_clock
      @date.strftime('%I:%M%P') if @date
    end

    def print_12_hour_clock_blank_padded
      @date.strftime('%l:%M%P') if @date
    end

    def print_date_to_number
      @date.strftime('%d%m%y') if @date
    end

    def print_day_abbrev_month_and_year
      @date.strftime('%d-%b-%y') if @date
    end

    def print_year_month_day
      @date.strftime('%Y-%m-%d') if @date
    end

    def print_abbrev_full_year_date
      @date.strftime('%d/%m/%Y') if @date
    end

    def print_full_month_year_date
      @date.strftime('%m/%d/%Y') if @date
    end

    def print_beginning_of_month
      "#{@date.beginning_of_month.strftime('%b %Y')}"
    end
  end
end
