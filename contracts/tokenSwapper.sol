// license: MIT

pragma solidity ^0.6.0;

import "./IUniswapV2Router02.sol";

contract TokenSwap {
    uint256 _amountOutMin = 100000;

    // address of the token to be swapped
    address public myTokenAddress = 0x08BF78D9b3Dff98A2eCb6E6a85e5d6e6694CE2bb;
    address public wethAddress = 0xB4FBF271143F4FBf7B91A5ded31805e42b2208d6;

    IUniswapV2Router02 public router;

    constructor() public {
        router = IUniswapV2Router02(0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D);
    }

    function swap(address tokenIn, uint256 amountIn, address tokenOut) public payable {
        address[] memory path = new address[](2);
        path[0] = tokenIn;
        path[1] = tokenOut;
        uint256 amountOutMin = _amountOutMin;
        router.swapExactTokensForETH(amountIn, amountOutMin, path, msg.sender, block.timestamp);
    }

    function swapYourTokenForEth() public { // swap 10 tokens from myTokenAddress for ETH
        uint256 amountIn = 1000000000;
        address tokenIn = myTokenAddress;
        address tokenOut = wethAddress;
        swap(tokenIn, amountIn, tokenOut);
    }

    function editAmountOutMin(uint256 amountOutMin) public {
        _amountOutMin = amountOutMin;
    }
    // deployed 0x32835e12E2A80D4137C2E3e71AEF4f24CA1229Ef
}