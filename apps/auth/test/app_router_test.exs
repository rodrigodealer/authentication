defmodule AppRouterTest do
  use ExUnit.Case, async: true
  use Plug.Test

  @opts AppRouter.init([])

  test "returns hello world" do
    # Create a test connection
    conn = conn(:get, "/")

    # Invoke the plug
    conn = AppRouter.call(conn, @opts)

    # Assert the response and status
    assert conn.state == :sent
    assert conn.status == 200
    assert conn.resp_body == "Hello world"
  end
end