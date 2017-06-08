class DebtCounter
  attr_accessor :sum, :percents_per_day, :period, :payments_number, :sum_per_operation

  def initialize(sum, percents_per_day, period, payments_number)
    @sum = sum
    @percents_per_day = percents_per_day
    @period = period
    @payments_number = payments_number
    @sum_per_operation = []
  end
  
  def count
    debt = sum
    total_excess = 0
    
    days_in_iteration = period / payments_number
    start_sum_for_payment = sum / payments_number
    
    iteration_excess = []
    
    payments_number.times do
      percents = (debt * days_in_iteration / 100).round
      total_excess += percents
      debt -= sum / payments_number
      sum_per_operation << percents + start_sum_for_payment
    end
    
    sum += total_excess
  end
end
