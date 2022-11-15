defmodule Horizon65.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :code, :string
      add :name, :string
      add :price, :float

      timestamps()
    end
  end
end
