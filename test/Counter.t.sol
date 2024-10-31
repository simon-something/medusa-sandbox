// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Counter} from "../src/Counter.sol";

contract CounterFuzz {
    Counter internal counter;
    uint256 ghost_number;

    constructor() {
        counter = new Counter();
    }

    function test_Increment() public {
        try counter.increment() {
            ghost_number++;
        } catch {
            assert(false);
        }
    }

    function property_AccurateIncrement() public view returns (bool) {
        return counter.number() == ghost_number;
    }

    receive() external payable {
        assert(false);
    }
}
