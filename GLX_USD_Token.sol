// SPDX-License-Identifier: CC-BY-4.0
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title GLX_USD_Token
 * [span_6](start_span)[span_7](start_span)@dev Universal bridge asset for the GlobalLink Network[span_6](end_span)[span_7](end_span).
 * [span_8](start_span)[span_9](start_span)This contract enforces centralized controller oversight for mint/burn operations[span_8](end_span)[span_9](end_span).
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
        [span_10](start_span)require(msg.sender == centralController, "Only the Central Controller can mint");[span_10](end_span)
        _mint(to, amount);
        emit TokensMinted(to, amount);
    }

    function burn(address from, uint256 amount) external {
        [span_11](start_span)require(msg.sender == centralController, "Only the Central Controller can burn");[span_11](end_span)
        _burn(from, amount);
        emit TokensBurned(from, amount);
    }
}
