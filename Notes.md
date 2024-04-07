# Provably Random Raffle Contracts

## About
This code is to create a random smart contract lottery

## What we want to do?

1. Allow users to enter the lottery by sending a certain amount of Ether to the contract

1. Users can enter by paying for a ticket
    1. The ticket fees are going to the lottery winner during the draw
2. After X period of time, the lottery will automatically draw a winner
    1. And this will be done programatically
3. Using Chainlink VRF & Chainlink Automation
    1. Chainlink VRF -> Ramdomness
    2. Chainlink Automation -> Time based Trigger