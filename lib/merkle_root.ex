defmodule MerkleRoot do
  def from_file(path) do
    File.stream!(path)
    |> get()
  end

  def get(transactions) do
    hashed_pairs = transactions
    |> Enum.chunk_every(2)
    |> Enum.map(&hash_transactions/1)

    if is_root(hashed_pairs) do
      Enum.at(hashed_pairs, 0)
    else
      get(hashed_pairs)
    end
  end

  defp hash_transactions([a]) do
    hash_transactions([a, a])
  end

  defp hash_transactions([a, b]) do
    hashed = a <> b
    |> hash()
    |> hash()
  end

  defp hash(str) do
    :crypto.hash(:sha256, str)
    |> Base.encode16(case: :lower)
  end

  defp is_root(pairs) do
    check = Enum.take(pairs, 2)
    length(check) == 1
  end
end
