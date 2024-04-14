// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

/** 
    @title A sample Raffle contract
    @author David Joseph
    @notice This cotract is for creating sample raffle Draws
    @dev Implements Chainlink VRFv2
 */

contract Raffle{
    error Raffle_NotEnoughEthSent();

    uint256 private immutable i_entranceFee; 
    // @dev duration of he contract in sec
    uint256 private immutable i_interval;
    address payable[] private s_players;

    uint256 private s_lastTimeStamp;

    event enteredRaffle(address indexed players);
    

    constructor(uint256 entranceFee, uint256 interval){
        i_entranceFee = entranceFee;
        i_interval = interval;
        s_lastTimeStamp = block.timestamp;
    }

    function enterRaffle() public payable {
        if(msg.value < i_entranceFee){
            revert Raffle_NotEnoughEthSent();
        }

        s_players.push(payable(msg.sender));
        // 1. makes migratuon easier
        // 2. makes frontend indexing easier
        emit enteredRaffle(msg.sender);
    }

    // 1. get  random number
    // 2. use the random number to pick a winner
    // 3. be automatically called
    function pickWinner() public view {
        if((block.timestamp - s_lastTimeStamp ) < i_interval ){
            revert();
        }
    }
    /** Getter Function */

    function getEntranceFee() external view returns (uint256){
        return i_entranceFee;
    }

    
}