defmodule IntralanguageSource.GRPC.Endpoint do
  use GRPC.Endpoint

  intercept GRPC.Logger.Server
  run IntralanguageSource.Demo.Server
end

defmodule IntralanguageSource.Demo.Server do
  use GRPC.Server, service: Intralanguage.Demo.Service

  def ping(request, _stream) do
    IO.puts(request.greet_message)

    acknowledgement = %{
      ackw_message: "Hello!"
    }
    Intralanguage.Acknowledgement.new(acknowledgement)
  end

  def run_in_loop() do
    {_service_alive_status, channel} = GRPC.Stub.connect("localhost:5002")
    IO.puts(" > Started The Server.")

    Enum.map(1..10, fn x ->
      IO.puts("\n> request no. #{x}")
      input_json = %{greet_message: "Hey Reciever, ping."}
      IO.inspect(input_json)
      input = Intralanguage.Greetings.new(input_json) #..> input JSON getting validate before sending
      {_pipeline_status, acknw} = Intralanguage.Demo.Stub.ping(channel, input)
      IO.inspect(acknw)
      :timer.sleep(2000)
    end)
  end
end
