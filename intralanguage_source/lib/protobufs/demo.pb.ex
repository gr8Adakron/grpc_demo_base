defmodule Intralanguage.Greetings do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          greet_message: String.t()
        }

  defstruct [:greet_message]

  field :greet_message, 1, type: :string
end

defmodule Intralanguage.Acknowledgement do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          ackw_message: String.t()
        }

  defstruct [:ackw_message]

  field :ackw_message, 1, type: :string
end

defmodule Intralanguage.Demo.Service do
  @moduledoc false
  use GRPC.Service, name: "intralanguage.Demo"

  rpc :Ping, Intralanguage.Greetings, Intralanguage.Acknowledgement
end

defmodule Intralanguage.Demo.Stub do
  @moduledoc false
  use GRPC.Stub, service: Intralanguage.Demo.Service
end
