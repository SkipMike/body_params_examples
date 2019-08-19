defmodule AppsignalExampleWeb.PageControllerTest do
  use AppsignalExampleWeb.ConnCase
  import OpenApiSpex.Test.Assertions

  test "GET /", %{conn: conn} do
    api_spec = AppsignalExample.Spec.spec()

    resp =
      conn
      |> put_req_header("content-type", "application/json")
      |> post("/", %{id: 1})
      |> json_response(200)

    assert_schema(resp, "IndexResponse", api_spec)
  end
end
