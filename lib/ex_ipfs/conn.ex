defmodule ExIpfs.Conn do
  def post(path, params \\ %{}) do
    Tesla.post(client(), path, params)
    |> case do
      {:ok, %Tesla.Env{status: 200, body: body}} -> {:ok, body}
      {:ok, %Tesla.Env{status: 400, body: body}} -> {:error, body}
      {:ok, %Tesla.Env{status: 500, body: body}} -> {:error, body}
      {:ok, %Tesla.Env{status: 404}} -> {:error, "NOT FOUND"}
      _ -> {:error, "SOMETHING WENT WRONG"}
    end
  end

  # def get(path, params \\ %{}) do
  #   Tesla.get(client(), path, query: params)
  # end

  @spec client :: Tesla.Client.t()
  defp client do
    middlewares = [
      {Tesla.Middleware.BaseUrl, base_url()},
      Tesla.Middleware.JSON
    ]

    Tesla.client(middlewares, Application.get_env(:tesla, :adapter))
  end

  defp base_url do
    Application.get_env(:ex_ipfs, :base_url)
  end
end
