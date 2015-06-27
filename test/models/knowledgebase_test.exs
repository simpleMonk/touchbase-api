defmodule Touchbaseapi.KnowledgebaseTest do
  use Touchbaseapi.ModelCase

  alias Touchbaseapi.Knowledgebase

  @valid_attrs %{active: true, created_date: %{day: 17, hour: 14, min: 0, month: 4, year: 2010}, detailed_description: "some content", id: "7488a646-e31f-11e4-aace-600308960662", short_description: "some content", title: "some content", updated_time: %{day: 17, hour: 14, min: 0, month: 4, year: 2010}}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Knowledgebase.changeset(%Knowledgebase{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Knowledgebase.changeset(%Knowledgebase{}, @invalid_attrs)
    refute changeset.valid?
  end
end
