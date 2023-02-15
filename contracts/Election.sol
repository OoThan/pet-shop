// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.4.22 <0.9.0;

contract Election {
    // Model a candidate
    // Store a candidate
    // Fetch a candidate
    // Store a candidate count

    struct Candidate {
        uint i;
        string name;
        uint voteCount;
    }

    mapping(uint => Candidate) public candidates;

    uint public candidatesCount;

    constructor() public {
        addCandidate("1st Candidate");
        addCandidate("2nd Candidate");
        addCandidate("3rd Candidate");
    }

    function addCandidate(string memory _name) private {
        candidatesCount++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }
}
