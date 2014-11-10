defmodule Stack.Server do
  use GenServer

  ##############
  # External API
  ##############

  def start_link(current_stack) do
    GenServer.start_link(__MODULE__, current_stack, name: __MODULE__)
  end

  def pop do
    GenServer.call(__MODULE__, :pop)
  end

  def push(item) do
    GenServer.cast(__MODULE__, {:push, item})
  end

  def terminate(reason, state) do
    IO.puts "Terminate called because reason[#{inspect reason}], current state[#{inspect state}]"
    { :ok }
  end

  ##########################
  # GenServer implementation
  ##########################

  def handle_call(:pop, _from, current_stack) do
    [head | remaining] = current_stack
    { :reply, head, remaining }
  end

  def handle_cast({:push, item}, current_stack) do
    { :noreply, [item | current_stack] }
  end
end
