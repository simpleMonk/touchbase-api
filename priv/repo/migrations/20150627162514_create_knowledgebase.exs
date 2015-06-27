defmodule Touchbaseapi.Repo.Migrations.CreateKnowledgebase do
  use Ecto.Migration

  def change do
    create table(:knowledgebases) do
      add :kb_id, :uuid
      add :title, :string
      add :short_description, :text
      add :detailed_description, :text
      add :created_date, :datetime
      add :updated_date, :datetime
      add :active, :boolean, default: false

      timestamps
    end

    create index(:knowledgebases, [:active,:created_date,:updated_date])

  end
end
