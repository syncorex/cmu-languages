defmodule SimpleVisor do
	def init do
		IO.puts("Starting supervisor.")

		Task.start_link(fn ->
	      Process.sleep(1_000_000)
		end)
	end

  def child_spec(_) do
    %{
      id: __MODULE__,
      start: {__MODULE__, :start_link, []},
      name: __MODULE__
    }
  end
end

SimpleVisor.init()