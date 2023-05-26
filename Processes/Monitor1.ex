defmodule Monitor1 do
  import :timer, only: [sleep: 1]

  def sad_function do
    sleep 500
    exit(:boom)
  end

  def run do
    Process.flag(:trap_exit, true)
    res = spawn_monitor(Monitor1, :sad_function, []) #can help figure out why other process exited
    IO.puts inspect res
    receive do
      msg -> IO.puts "message received: #{inspect msg}"
    after 1000 -> IO.puts "Nothing happened"
  end
end
end

Link1.run
