require "total"

RSpec.describe "item total" do
  let (:items) do
    [{name: "milk", price: 2.99, quantity: 2},
     {name: "soda", price: 1.00, quantity: 1},
     {name: "t-shirt", price: 19.99, quantity: 3}]
  end

  let(:tax) do
    0.05
  end

  # function that checks how many decimal places the return value is up too
  let(:decimal_size) do
    ->(x) { x.to_s.split('.').last.size }
  end

  it "should return the total of your purchase" do
    expect(total(items)).to eq(66.95)
  end

  it "should account for tax when provided in the argument" do
    expect(total(items, tax)).to eq(70.30)
  end

  # lookup float#round
  it "should not round to more then 2 places when doing the calculations" do
    expect( decimal_size.call(total(items, tax)) ).to <= 2
  end


end
