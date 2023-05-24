case File.open("lib/abc") do
  {:ok, file} ->
    IO.puts "Opened file..."
    process(file)
  {:error, message} ->
    IO.puts :stderr, "Couldn't open file..."
  end
