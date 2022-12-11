defmodule Healer do
	def init(main_pid, functions) do
		state = Enum.into(functions, %{}, fn func ->
			pid = spawn(func)
			ref = Process.monitor(pid)
			{ref, func}
		end)

		send(main_pid, :ready)
		supervise(state)
	end

	defp supervise(state) do
		state = receive do
			{:DOWN, _ref, :process, _pid, :normal} -> state
			{:DOWN, ref, :process, _pid, _crashed} ->
			IO.puts("Worker has crashed. Restarting...") 
			{func, state} = Map.pop(state, ref)
			pid = spawn(func)
			ref = Process.monitor(pid)
			Map.put(state, ref, func)
		end
		supervise(state)
	end 
end

defmodule Worker do 
	def run() do
		Process.register(self(), :worker)
		run(10)
	end

	def run(num) do
		IO.puts("Worker is working, with a fatigue of #{Float.round(10 / num)}")
		:timer.sleep(1000)
		run(num - 1)
		send(:worker, :ready)
	end

end

spawn fn ->
	Healer.init(self(), [&Worker.run/0])
end

receive do
	:ready -> :ok
end