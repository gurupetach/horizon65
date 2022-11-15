defmodule Horizon65.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :code, :string
      add :name, :string
      add :price, :integer

      timestamps()
    end
  end
end
