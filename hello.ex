defmodule S do
  @on_load :init

  def init do
    :erlang.load_nif('elixir/plus_one', 0)
  end

  def plus_one(_n) do
    raise "nif library not loaded"
  end

  def run(count) do
    t0 = :os.system_time(:milli_seconds)
    Enum.each(1..count, &plus_one/1)
    t1 = :os.system_time(:milli_seconds)
    IO.puts(t1-t0)
  end

  def start do
    args = System.argv
    l = length(args)
    if l == 0 do
      IO.puts('First arg (0 - 2000000000) is required.')
    else
      count = String.to_integer(Enum.at(args, 0))
      if count < 1 or count > 2_000_000_000 do
        IO.puts('Must be a positive number not exceeding 2 billion.')
      else
        run(count)
      end
    end
  end
end
