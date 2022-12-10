pid = spawn(
 fn ->
   IO.puts "Starting Process"
   :timer.sleep(10000)
 end
)
:timer.sleep(1000)
IO.puts Process.alive?(pid)