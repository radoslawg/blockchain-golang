package blockchain

import (
	"bytes"
	"crypto/sha256"
	"encoding/binary"
	"fmt"
	"log"
	"math/big"
)

// Take data from the blockchain and create a proof of work
// create a counter (nonce) which starts at 0 and increments
// create a hash of the data and nonce
// check the hash to see if it meets a set of requirements

// Requirements:
// The first few bytes myst contain 0s

// The Difficulty should increase over time to take into account the increase in computing power
// and number of miners
const Difficulty = 18 // Number of leading zeros required in the hash

type ProofOfWork struct {
	Block  *Block
	Target *big.Int
}

func NewProof(block *Block) *ProofOfWork {
	target := big.NewInt(1)
	target.Lsh(target, uint(256-Difficulty)) // Shift left by (256 - Difficulty) bits

	return &ProofOfWork{
		Block:  block,
		Target: target,
	}
}

func (pow *ProofOfWork) InitData(nonce int) []byte {
	data := bytes.Join(
		[][]byte{
			pow.Block.PrevHash,
			pow.Block.Data,
			toHex(int64(nonce)),
			toHex(int64(Difficulty)),
		},
		[]byte{},
	)
	return data
}

func (pow *ProofOfWork) Run() (int, []byte) {
	nonce := 0
	var intHash big.Int
	var hash [32]byte

	for {
		data := pow.InitData(nonce)
		hash = sha256.Sum256(data)

		fmt.Printf("\r%x", hash)
		intHash.SetBytes(hash[:])
		if intHash.Cmp(pow.Target) == -1 {
			break
		}
		nonce++
	}
	fmt.Println()

	return nonce, hash[:]
}

func (pow *ProofOfWork) Validate() bool {
	var intHash big.Int
	data := pow.InitData(pow.Block.Nonce)
	hash := sha256.Sum256(data)
	intHash.SetBytes(hash[:])

	return intHash.Cmp(pow.Target) == -1
}

func toHex(num int64) []byte {
	buf := new(bytes.Buffer)
	err := binary.Write(buf, binary.BigEndian, num)
	if err != nil {
		log.Panic(err)
	}
	return buf.Bytes()
}
