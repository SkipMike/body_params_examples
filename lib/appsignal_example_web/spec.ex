defmodule AppsignalExample.Spec do
  alias OpenApiSpex.{OpenApi, Server, Info, Paths}

  @behaviour OpenApi

  @impl OpenApi
  def spec do
    %OpenApi{
      servers: [
        # Populate the Server info from a phoenix endpoint
        Server.from_endpoint(AppsignalExampleWeb.Endpoint)
      ],
      info: %Info{
        title: "Example",
        version: "1.0"
      },
      # populate the paths from a phoenix router
      paths: Paths.from_router(AppsignalExampleWeb.Router)
    }
    # discover request/response schemas from path specs
    |> OpenApiSpex.resolve_schema_modules()
  end
end
