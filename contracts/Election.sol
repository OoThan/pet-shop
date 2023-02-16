// SPDX-License-Identifier: MIT
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

    // Store accounts that have voted
    mapping(address => bool) public voters;

    // Store candidates
    // Fetches candidates
    mapping(uint => Candidate) public candidates;

    // Store candidates count
    uint public candidatesCount;

    // voted event
    event votedEvent (uint indexed _candidateID);

    constructor() public {
        addCandidate("1st Candidate");
        addCandidate("2nd Candidate");
        addCandidate("3rd Candidate");
    }

    function addCandidate(string memory _name) private {
        candidatesCount++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }

    function vote (uint _candidateId) public {
        // require that they haven't voted before
        require(!voters[msg.sender]);

        // require a valid candidate
        require(_candidateId > 0 && _candidateId <= candidatesCount);

        // record that voter has voted
        voters[msg.sender] = true;

        // update candidate vote count
        candidates[_candidateId].voteCount ++;

        // trigger voted event
       emit votedEvent(_candidateId);
    }
}
