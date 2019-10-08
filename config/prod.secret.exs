# In this file, we load production configuration and secrets
# from environment variables. You can also hardcode secrets,
# although such is generally not recommended and you have to
# remember to add this file to your .gitignore.
use Mix.Config

config :chitchat, ChitchatWeb.Endpoint,
  http: [:inet6, port: "4000"],
  secret_key_base: "WGuxirP1hFMy2K3PDRpuS8sMPnbj/KxZ2P+s4EQm13lKfoTvkh53vtVp3CxBdaro"

# ## Using releases (Elixir v1.9+)
#
# If you are doing OTP releases, you need to instruct Phoenix
# to start each relevant endpoint:

config :chitchat, ChitchatWeb.Endpoint, server: true

# Then you can assemble a release by calling `mix release`.
# See `mix help release` for more information.
