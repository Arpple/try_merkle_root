defmodule MerkleRootTest do
  use ExUnit.Case
  doctest MerkleRoot

  test "non pair transaction should be duplicate as pair" do
    single_transactions = ["11"]
    duplicated_transactions = ["11", "11"]

    assert MerkleRoot.get(single_transactions) == MerkleRoot.get(duplicated_transactions)
  end

  test "try calculate with some transactions" do
    transactions = [
      "8c14f0db3df150123e6f3dbbf30f8b955a8249b62ac1d1ff16284aefa3d06d87",
      "fff2525b8931402dd09222c50775608f75787bd2b87e56995a7bdd30f79702c4",
      "6359f0868171b1d194cbee1af2f16ea598ae8fad666d9b012c8ed2b79a236ec4",
      "e9a66845e05d5abc0ad04ec80f774a7e585c6e8db975962d069a522137b80c1d",
    ]

    MerkleRoot.get(transactions)
  end
end
