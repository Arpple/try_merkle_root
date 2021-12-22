# MerkleRoot

challenge project for calculating merkle root  
*the result may not look the same with BitCoin's implementation as it have different endian convention*

## Trying it out

```shell
$> iex -S mix

# from file
iex> MerkleRoot.from_file("input.txt")

# or other Stream
iex> MerkleRoot.get(["a", "b", "c", "d"])
```

