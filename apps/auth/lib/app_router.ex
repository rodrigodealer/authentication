defmodule AppRouter do
  import Plug.Conn
  use Plug.Router

  plug :match
  plug :dispatch

  get "/" do
    send_resp(conn, 200, "Hello world")
  end

  get "/hello" do
    person = %Person{name: "Meg"}
    map = %{a: 1, b: 2}
    
    case HTTPoison.get("http://httparrot.herokuapp.com/get") do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        IO.puts body
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        IO.puts "Not found :("
      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.puts reason
    end
    
    send_resp(conn, 200, Poison.Encoder.encode(person, []))
  end

  match _ do
    send_resp(conn, 404, "OPS!")
  end
end