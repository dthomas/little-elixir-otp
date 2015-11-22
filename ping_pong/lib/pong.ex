defmodule PingPong.Pong do
  def loop() do
    receive do
      {:pong, pid} ->
        IO.puts "#{inspect self}: Sending PING to #{inspect pid}"
        send(pid, {:ping, self})
        loop
      _ ->
        IO.puts "PONG: Exiting..."
    end
  end
end
