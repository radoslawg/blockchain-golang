package main

import (
	"fmt"

	"github.com/radoslawg/blockchain-golang/blockchain"
)

func main() {
	chain := blockchain.InitBlockChain()
	chain.AddBlock("First Block")
	chain.AddBlock("Second Block")
	chain.AddBlock("Third Block")

	for _, block := range chain.Blocks {
		fmt.Printf("Previous hash: %x\n", block.PrevHash)
		fmt.Printf("Data in Block: %x\n", block.Data)
		fmt.Printf("Hash: %x\n", block.Hash)
	}
}
