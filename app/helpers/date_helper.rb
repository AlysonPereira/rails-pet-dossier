module DateHelper
  def string_to_date(vaccination_day,string)
    case string
    when 'in 1 week'
      vaccination_day.next_week
    when 'in 15 days'
      vaccination_day + 15
    when 'in 1 month'
      vaccination_day.next_month
    when 'in 4 months'
      vaccination_day + 4.months
    when 'in 6 months'
      vaccination_day + 6.months
    when 'in 1 year'
      vaccination_day.next_year
    else
      0
    end
  end
end
