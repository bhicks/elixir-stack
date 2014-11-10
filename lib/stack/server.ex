defmodule Stack.Server do
  use GenServer

  def handle_call(:pop, _from, current_stack) do
    [head | remaining] = current_stack
    { :reply, head, remaining }
  end

  def handle_cast({:push, item}, current_stack) do
    { :noreply, [item | current_stack] }
  end
end
