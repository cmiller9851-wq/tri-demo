// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title GLX_USD_Token
 * @dev The native, non-volatile settlement asset for the GlobalLink Network.
 */
contract GLX_USD_Token is ERC20, Ownable {
    address public centralController;

    event TokensMinted(address indexed to, uint256 amount);
    event TokensBurned(address indexed from, uint256 amount);

    constructor(address _centralController) ERC20("GlobalLink Settlement Unit", "GLX-USD") {
        require(_centralController != address(0), "Controller address cannot be zero");
        centralController = _centralController;
    }

    function mint(address to, uint256 amount) external {
        [span_6](start_span)require(msg.sender == centralController, "Only the Central Controller can mint");[span_6](end_span)
        _mint(to, amount);
        [span_7](start_span)emit TokensMinted(to, amount);[span_7](end_span)
    }

    function burn(address from, uint256 amount) external {
        [span_8](start_span)require(msg.sender == centralController, "Only the Central Controller can burn");[span_8](end_span)
        _burn(from, amount);
        [span_9](start_span)emit TokensBurned(from, amount);[span_9](end_span)
    }
}
