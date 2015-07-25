defmodule Auth do

  def init(options) do
    options
  end

  def call(conn, _opts) do
    AppRouter.call(conn, AppRouter.init([]))
  end
end

port = System.get_env("PORT")
if port == nil do
	port = "4000"
end

IO.puts "Running RestApi with Cowboy on http://localhost:#{port}"
Plug.Adapters.Cowboy.http Auth, [], port: String.to_integer(port)