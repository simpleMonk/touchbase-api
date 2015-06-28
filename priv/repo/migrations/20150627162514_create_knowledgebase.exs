defmodule Touchbaseapi.Repo.Migrations.CreateKnowledgebase do
  use Ecto.Migration

  def change do
    create table(:knowledgebases,primary_key: false) do
      add :id, :uuid,primary_key: true
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
