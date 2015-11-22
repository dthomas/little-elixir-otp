defmodule PingPong do
  def ping_pong() do
    ping_pid = spawn(PingPong.Ping, :loop, [])
    pong_pid = spawn(PingPong.Pong, :loop, [])
    send(ping_pid, {:ping, pong_pid})
  end
end
