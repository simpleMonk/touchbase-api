defmodule Touchbaseapi.Knowledgebase do
  use Touchbaseapi.Web, :model

  schema "knowledgebases" do
    field :kb_id, Ecto.UUID
    field :title, :string
    field :short_description, :string
    field :detailed_description, :string
    field :created_date, Ecto.DateTime
    field :updated_date, Ecto.DateTime, default: Ecto.DateTime.utc()
    field :active, :boolean, default: true

    timestamps
  end

  @required_fields ~w(title short_description detailed_description )
  @optional_fields ~w(created_date kb_id)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If `params` are nil, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
