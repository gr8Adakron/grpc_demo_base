defmodule IntralanguageReceiver.GRPC.Endpoint do
  use GRPC.Endpoint

  intercept GRPC.Logger.Server
  run IntralanguageReceiver.Demo.Server
end

defmodule IntralanguageReceiver.Demo.Server do
  use GRPC.Server, service: Intralanguage.Demo.Service

  def ping(request, _stream) do
    IO.puts("Input recieved: #{request.greet_message}")

    acknowledgement = %{
      ackw_message: "Hello Source, pong."
    }
    Intralanguage.Acknowledgement.new(acknowledgement)
  end
end
