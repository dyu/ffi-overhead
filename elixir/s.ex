defmodule S do
  @on_load :init

  def init do
    :erlang.load_nif('./plus_one', 0)
  end

  def plus_one(_n) do
    raise "nif library not loaded"
  end

  def run do
    t0 = :os.system_time(:milli_seconds)
    Enum.each(1..2_000_000_000, &plus_one/1)
    t1 = :os.system_time(:milli_seconds)
    IO.puts(t1-t0)
  end
end
