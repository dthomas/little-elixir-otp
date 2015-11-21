defmodule MyList do
  def flatten([]), do: []
  def flatten([head| tail]) do
    IO.puts "flattening #{head}"
    [flatten(head) | flatten(tail)]
  end
  def flatten(head), do: head

  def sum([]), do: 0
  def sum([head | tail]) do
    head + sum(tail)
  end

  def rev_flatten([]), do: []
  def rev_flatten([head | tail]) do
    rev_flatten(tail) ++ rev_flatten(head)
  end
  def rev_flatten(head), do: [head]
end
