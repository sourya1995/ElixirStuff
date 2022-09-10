defmodule SecondList do
  def square([]), do: 0
  def square([head | tail]) do
    [head * head | square(tail)]
  end
end
