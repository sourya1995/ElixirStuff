defmodule Spawn1 do
  def greet do
    receive do
      {sender, msg} -> send sender, { :ok, "Hello, #{msg}"}
      greet() #tail call optimization
    end
  end
end

pid = spawn(Spawn1, :greet, [])
send pid, {self(), "World!"}

receive do
  {:ok, message} -> IO.puts message
end

send pid, {self(), "Kermit!"}
receive do
  {:ok, message} -> IO.puts message
after 500 -> IO.puts "greeter has gone away" #if no message is received in 500ms, this is displayed
end
