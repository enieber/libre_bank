import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :libre_bank, LibreBank.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "libre_bank_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :libre_bank, LibreBankWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "qy10im/CVVybKuYtww3+ocPwz9mh3qeSRQ3RSaLVKbK3VME5Tmkaf4i/FUQUQRFa",
  server: false

# In test we don't send emails.
config :libre_bank, LibreBank.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
