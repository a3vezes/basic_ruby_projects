def fibonacci(n)
  n.between?(0, 1) ? n : fibonacci(n - 1) + fibonacci(n - 2)
end
