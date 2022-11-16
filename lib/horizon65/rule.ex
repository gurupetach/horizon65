defmodule Horizon65.Rule do
  @moduledoc """
  The Rule module. Provides rules to be used
  """

  def calculate_price(%{
        voucher_count: voucher_count,
        tshirt_count: tshirt_count,
        mug_count: mug_count
      })
      when tshirt_count >= 3 do
    if rem(voucher_count, 2) == 0 do
      voucher_count = div(voucher_count, 2)

      price = voucher_count * 5 + mug_count * 7.5 + tshirt_count * 19
      price
    else
      voucher_count = div(voucher_count, 2) + 1

      price = voucher_count * 5 + mug_count * 7.5 + tshirt_count * 19
      price
    end
  end

  def calculate_price(%{
        voucher_count: voucher_count,
        tshirt_count: tshirt_count,
        mug_count: mug_count
      })
      when tshirt_count < 3 do
    if rem(voucher_count, 2) == 0 do
      voucher_count = div(voucher_count, 2)
      price = voucher_count * 5 + mug_count * 7.5 + tshirt_count * 20
      price
    else
      voucher_count = div(voucher_count, 2) + 1
      price = voucher_count * 5 + mug_count * 7.5 + tshirt_count * 20
      price
    end
  end
end
