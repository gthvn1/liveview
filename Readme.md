# LiveView Playground

Experimental [Live view](https://github.com/phoenixframework/phoenix_live_view) projects for prototyping and exploring.

- Start: https://hexdocs.pm/phoenix/up_and_running.html
  
# Notes

- Currently projects are created using: `mix phx.new hello --no-ecto`
  - TODO: setup a database 
- On NixOS, I need to modify `config/config.exs` to correctly set up Tailwind and esbuild. Here is an example of my configuration:
```erlang
# Configure esbuild (the version is required)
config :esbuild,
  version: "0.25.5",
  path: System.get_env("ESBUILD_PATH") || System.find_executable("esbuild"),
  ...
```
```erlang
# Configure tailwind (the version is required)
config :tailwind,
  version: "4.1.18",
  path: System.get_env("TAILWINDCSS_PATH") || System.find_executable("tailwindcss"),
  ...
```
