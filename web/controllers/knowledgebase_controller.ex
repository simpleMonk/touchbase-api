defmodule Touchbaseapi.KnowledgebaseController do
  use Touchbaseapi.Web, :controller

  alias Touchbaseapi.Knowledgebase

  plug :scrub_params, "knowledgebase" when action in [:create, :update]
  plug :action

  def index(conn, _params) do
    knowledgebases = Repo.all(Knowledgebase)
    render(conn, "index.json", knowledgebases: knowledgebases)
  end

  def create(conn, %{"knowledgebase" => knowledgebase_params}) do
    changeset = Knowledgebase.changeset(%Knowledgebase{}, knowledgebase_params)
    changeset = changeset |> add_created_time_to |> put_uuid

    if changeset.valid? do
      knowledgebase = Repo.insert!(changeset)
      render(conn, "show.json", knowledgebase: knowledgebase)
    else
      conn
      |> put_status(:unprocessable_entity)
      |> render(Touchbaseapi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    knowledgebase = Repo.get_by(Knowledgebase,kb_id: id)
    render conn, "show.json", knowledgebase: knowledgebase
  end

  def update(conn, %{"id" => id, "knowledgebase" => knowledgebase_params}) do
    knowledgebase = Repo.get_by(Knowledgebase,kb_id: id)
    changeset = Knowledgebase.changeset(knowledgebase, knowledgebase_params)

    if changeset.valid? do
      knowledgebase = Repo.update(changeset)
      render(conn, "show.json", knowledgebase: knowledgebase)
    else
      conn
      |> put_status(:unprocessable_entity)
      |> render(Touchbaseapi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    knowledgebase = Repo.get_by(Knowledgebase,kb_id: id)

    knowledgebase = Repo.delete(knowledgebase)
    render(conn, "show.json", knowledgebase: knowledgebase)
  end

  def add_created_time_to(changeset) do
    Ecto.Changeset.put_change(changeset,:created_date, Ecto.DateTime.utc())
  end

  def put_uuid(changeset) do
    Ecto.Changeset.put_change(changeset, :kb_id, Ecto.UUID.generate())
  end
end
