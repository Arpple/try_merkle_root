defmodule MerkleRoot do
  def from_file(path) do
    File.stream!(path)
    |> get()
  end

  def get(transactions) do
    hashed_pairs = transactions
    |> Enum.chunk_every(2)
    |> Enum.map(&hash_pair/1)

    if is_root(hashed_pairs) do
      Enum.at(hashed_pairs, 0)
    else
      get(hashed_pairs)
    end
  end

  defp hash_pair([a]) do
    # without pair, hash with itself
    hash_pair([a, a])
  end

  defp hash_pair([a, b]) do
    a <> b
    |> hash()
  end

  defp hash(str) do
    :crypto.hash(:sha256, str)
    |> Base.encode16(case: :lower)
  end

  defp is_root(pairs) do
    length(pairs) == 1
  end
end
