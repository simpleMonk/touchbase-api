defmodule Touchbaseapi.KnowledgebaseView do
  use Touchbaseapi.Web, :view

  def render("index.json", %{knowledgebases: knowledgebases}) do
    %{data: render_many(knowledgebases, "knowledgebase.json")}
  end

  def render("show.json", %{knowledgebase: knowledgebase}) do
    %{data: render_one(knowledgebase, "knowledgebase.json")}
  end

  def render("knowledgebase.json", %{knowledgebase: knowledgebase}) do
    %{
      id: knowledgebase.id,
      title: knowledgebase.title,
      short_description: knowledgebase.short_description,
      detailed_description: knowledgebase.detailed_description,
      created_date: knowledgebase.created_date,
      updated_date: knowledgebase.updated_date
      }
  end
end
