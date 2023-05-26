defmodule Sequence.Server do
  use GenServer
  alias Sequence.Impl


  def next(number),       do: number + 1
  def increment(number)   do: number + delta


  def init(initial_number) do
    {:ok, initial_number}
  end

  def handle_call(:next_number, _from, current_number) do
    {:reply, current_number, Impl.next(current_number)}
  end

  def handle_cast({:increment_number, delta}, current_number) do #if there is no response
    { :no_reply, Impl.increment(current_number)}
  end

  def format_status(_reason, [ _pdict, state ]) do
    [data: [{'State', "My current state is '#{inspect state}', and I'm happy"}]]
  end

  def terminate(_reason, current_number) do
    Sequence.Stash.update(current_number)
  end

end
