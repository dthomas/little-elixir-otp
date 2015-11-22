defmodule PingPong.Ping do
  def loop() do
    receive do
      {:ping, pid} ->
        IO.puts "#{inspect self}: Sending PONG to #{inspect pid}"
        send(pid, {:pong, self})
        loop
      _ ->
        IO.puts "PING: Exiting..."
    end
  end
end
