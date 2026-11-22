# Blockchain Workshop — PayETH

A small workshop demo of paying with crypto the way you'd pay with UPI: a `PayETH.sol` contract and a plain HTML frontend branded "Pay INR — Blockchain UPI". No build tools — just a contract and a static page that talks to it through ethers.js.

## Features

- `PayETH.sol` payment contract
- Static frontend (plain HTML/CSS/JavaScript) that connects a wallet and sends a payment
- ethers.js loaded from CDN — no bundler or framework

## Tech Stack

- Solidity (`PayETH.sol`)
- Plain HTML / JavaScript frontend
- ethers.js (CDN)
- MetaMask

## Getting Started

Prerequisites: MetaMask in your browser, and the `PayETH` contract deployed to a network your wallet can reach. You'll need the deployed contract address for the frontend to talk to.

```bash
# No install step — just open the frontend
open frontend/index.html
```

Or serve the folder with any static server:

```bash
npx serve frontend
```

Then:

1. Open the page in a browser with MetaMask installed.
2. Connect your wallet.
3. Make sure the frontend is pointing at your deployed contract, and you're on the right network.
4. Enter an amount and pay.

## Project Structure

```text
contracts/   # PayETH.sol
frontend/    # index.html workshop demo page
```

## Notes

- This is a workshop / teaching demo, not a production payment system — only use it with test funds on a test network.
