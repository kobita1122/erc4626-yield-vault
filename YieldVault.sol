// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/extensions/ERC4626.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract YieldVault is ERC4626 {
    address public owner;

    constructor(
        IERC20 _asset,
        string memory _name,
        string memory _symbol
    ) ERC4626(_asset) ERC20(_name, _symbol) {
        owner = msg.sender;
    }

    /**
     * @dev Total assets managed by the vault. 
     * In a real strategy, this would include assets deployed in external protocols.
     */
    function totalAssets() public view override returns (uint256) {
        return super.totalAssets();
    }

    /**
     * @dev Simulation of a yield-generating event.
     * In production, this would be a harvest function that collects interest.
     */
    function mockProfit(uint256 _amount) external {
        require(msg.sender == owner, "Only owner");
        // This simulates the vault "earning" tokens via a strategy
        SafeERC20.safeTransferFrom(IERC20(asset()), msg.sender, address(this), _amount);
    }

    /**
     * @dev Hook that is called before any deposit or withdrawal.
     */
    function _beforeTokenTransfer(address from, address to, uint256 amount) internal virtual {
        // Custom logic like performance fee calculations can go here
    }
}
