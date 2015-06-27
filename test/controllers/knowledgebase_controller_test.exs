defmodule Touchbaseapi.KnowledgebaseControllerTest do
  use Touchbaseapi.ConnCase

  alias Touchbaseapi.Knowledgebase
  @valid_attrs %{active: true, created_date: %{day: 17, hour: 14, min: 0, month: 4, year: 2010}, detailed_description: "some content",id: 101, kb_id:   Ecto.UUID.generate(), short_description: "some content", title: "some content", updated_time: %{day: 17, hour: 14, min: 0, month: 4, year: 2010}}
  @invalid_attrs %{}

  setup do
    conn = conn() |> put_req_header("accept", "application/json")
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, knowledgebase_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    knowledgebase = Repo.insert %Knowledgebase{}
    conn = get conn, knowledgebase_path(conn, :show, knowledgebase)
    assert json_response(conn, 200)["data"] == %{
      id: knowledgebase.kb_id,
      title: knowledgebase.title,
      short_description: knowledgebase.short_description,
      detailed_description: knowledgebase.detailed_description,
      created_date: knowledgebase.created_date,
      updated_date: knowledgebase.updated_date
    }
  end

  # test "creates and renders resource when data is valid", %{conn: conn} do
  #   conn = post conn, knowledgebase_path(conn, :create), knowledgebase: @valid_attrs
  #   assert json_response(conn, 200)["data"]["id"]
  #   assert Repo.get_by(Knowledgebase,kb_id: @valid_attrs.kb_id)
  # end

  # test "does not create resource and renders errors when data is invalid", %{conn: conn} do
  #   conn = post conn, knowledgebase_path(conn, :create), knowledgebase: @invalid_attrs
  #   assert json_response(conn, 422)["errors"] != %{}
  # end
  #
  # test "updates and renders chosen resource when data is valid", %{conn: conn} do
  #   knowledgebase = Repo.insert %Knowledgebase{}
  #   conn = put conn, knowledgebase_path(conn, :update, knowledgebase), knowledgebase: @valid_attrs
  #   assert json_response(conn, 200)["data"]["id"]
  #   assert Repo.get_by(Knowledgebase, @valid_attrs)
  # end
  #
  # test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
  #   knowledgebase = Repo.insert %Knowledgebase{}
  #   conn = put conn, knowledgebase_path(conn, :update, knowledgebase), knowledgebase: @invalid_attrs
  #   assert json_response(conn, 422)["errors"] != %{}
  # end
  #
  # test "deletes chosen resource", %{conn: conn} do
  #   knowledgebase = Repo.insert %Knowledgebase{}
  #   conn = delete conn, knowledgebase_path(conn, :delete, knowledgebase)
  #   assert json_response(conn, 200)["data"]["id"]
  #   refute Repo.get_by(Knowledgebase, kb_id: knowledgebase.kb_id)
  # end
end
