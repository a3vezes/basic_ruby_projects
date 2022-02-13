class Calculator
  def add(*numbers)
    numbers.sum
  end

  def multiply(a, b)
    a * b
  end

  def subtract(a, b)
    a - b
  end

  def divide(a, b)
    a / b
  rescue ZeroDivisionError
    'I can\'t divide by zero'
  end
end
