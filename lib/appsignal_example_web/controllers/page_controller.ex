defmodule AppsignalExampleWeb.PageController do
  require OpenApiSpex
  use AppsignalExampleWeb, :controller
  alias OpenApiSpex.{Operation, Schema}

  plug(OpenApiSpex.Plug.Cast)
  plug(OpenApiSpex.Plug.Validate)

  @spec open_api_operation(any) :: Operation.t()
  def open_api_operation(action) do
    operation = String.to_existing_atom("#{action}_operation")
    apply(__MODULE__, operation, [])
  end

  def index(%{body_params: %{id: id}} = conn, _params) do
    conn
    |> json(%{
      id: id
    })
  end

  defmodule IndexRequest do
    OpenApiSpex.schema(%{
      title: "IndexRequest",
      type: :object,
      properties: %{
        id: %Schema{type: :integer}
      },
      required: [:id]
    })
  end

  defmodule IndexResponse do
    OpenApiSpex.schema(%{
      title: "IndexResponse",
      type: :object,
      properties: %{
        id: %Schema{type: :integer}
      },
      required: [:id]
    })
  end

  def index_operation do
    %Operation{
      tags: ["page"],
      operationId: "PageController.index",
      requestBody: Operation.request_body("Index operation", "application/json", IndexRequest),
      responses: %{
        200 => Operation.response("Id", "application/json", IndexResponse)
      }
    }
  end
end
