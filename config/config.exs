import Config

config :tesla, adapter: Tesla.Adapter.Hackney

config :ex_ipfs, :base_url, "http://localhost:5001/api/v0"

import_config "#{Mix.env()}.exs"
