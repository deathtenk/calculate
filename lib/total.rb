def total(items,tax=0)
  total = 0.0
  items.each do |item|
    total += item.fetch(:price) * item.fetch(:quantity)
  end
  if tax then
    total *= 1 + tax
  end

  total.round(2)
end
