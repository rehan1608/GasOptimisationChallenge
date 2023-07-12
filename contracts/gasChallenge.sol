// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract gasChallenge {
    uint256 constant ARRAY_SIZE = 10; // Set the fixed size of the array

    uint8[ARRAY_SIZE] numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

    uint256 sumOfArray; // Cache the sum of the array

    function getSumOfArray() public view returns (uint256) {
        return sumOfArray;
    }

    function notOptimizedFunction() public {
        for (uint256 i = 0; i < numbers.length; i++) {
            numbers[i] = 0;
        }
    }

    function optimizedFunction() public {
        unchecked {
            // Use unchecked block to skip checks
            uint256 sum = 0;
            for (uint256 i = 0; i < numbers.length; i++) {
                numbers[i] = 0;
                sum += numbers[i];
            }
            sumOfArray = sum; // Cache the sum of the array
        }
    }
}
