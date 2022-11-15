# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Horizon65.Repo.insert!(%Horizon65.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Horizon65.Repo
alias Horizon65.Products.Product

Repo.insert!(%Product{
  code: "VOUCHER",
  name: "Cabify Voucher",
  price: 5.00
})

Repo.insert!(%Product{
  code: "TSHIRT",
  name: "Cabify T-Shirt",
  price: 20.00
})

Repo.insert!(%Product{
  code: "MUG",
  name: "Cabify Coffee Mug",
  price: 7.50
})
