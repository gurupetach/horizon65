import Config

# For production, don't forget to configure the url host
# to something meaningful, Phoenix uses this information
# when generating URLs.
#
# Note we also include the path to a cache manifest
# containing the digested version of static files. This
# manifest is generated by the `mix phx.digest` task,
# which you should run after static files are built and
# before starting your production server.
config :horizon65, Horizon65Web.Endpoint, cache_static_manifest: "priv/static/cache_manifest.json"

config :horizon65, Horizon65Web.Endpoint,
  url: [schema: "https", host: "secret-taiga-74138.herokuapp.com", port: 443],
  cache_static_manifest: "priv/static/cache_manifest.json",
  force_ssl: [rewrite_on: [:x_forwarded_proto]],
  secret_key_base: "73BAPjneM9RnHeVsrPHDsXa/U9u6Pf8gx3VyehoQ1GlXKDv451S70X/FFs5Kwbvd",
  check_origin: ["https://secret-taiga-74138.herokuapp.com", "//*.herokuapp.com"]

# Configure your database
config :horizon65, Horizon65.Repo,
  adapter: Ecto.Adapters.Postgres,
  url: System.get_env("DATABASE_URL"),
  pool_size: 18,
  ssl: true,
  ssl_opts: [log_level: :error]

# Do not print debug messages in production
config :logger, level: :info

# ## SSL Support
#
# To get SSL working, you will need to add the `https` key
# to the previous section and set your `:url` port to 443:
#
#     config :horizon65, Horizon65Web.Endpoint,
#       ...,
#       url: [host: "example.com", port: 443],
#       https: [
#         ...,
#         port: 443,
#         cipher_suite: :strong,
#         keyfile: System.get_env("SOME_APP_SSL_KEY_PATH"),
#         certfile: System.get_env("SOME_APP_SSL_CERT_PATH")
#       ]
#
# The `cipher_suite` is set to `:strong` to support only the
# latest and more secure SSL ciphers. This means old browsers
# and clients may not be supported. You can set it to
# `:compatible` for wider support.
#
# `:keyfile` and `:certfile` expect an absolute path to the key
# and cert in disk or a relative path inside priv, for example
# "priv/ssl/server.key". For all supported SSL configuration
# options, see https://hexdocs.pm/plug/Plug.SSL.html#configure/1
#
# We also recommend setting `force_ssl` in your endpoint, ensuring
# no data is ever sent via http, always redirecting to https:
#
#     config :horizon65, Horizon65Web.Endpoint,
#       force_ssl: [hsts: true]
#
# Check `Plug.SSL` for all available options in `force_ssl`.
