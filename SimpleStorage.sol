// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

contract SimpleStorage {

    // automatic initialization to zero if no assigned value
    uint256 favoriteNumber;

    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }

    struct People {
        uint256 favoriteNumber;
        string name;
    }

    People[] public people;
    mapping(string => uint256) public nameToFavoriteNumber;

    // People public person = People({favoriteNumber: 2, name: 'Paul'});

    // two special keywords that you don't require transactions: view and pure
        // view: simple reading of data from blockchain [no state delta]
        // pure: functions that purely do computational math
    function retrieve() public view returns(uint256) {
        // return favoriteNumber;
        return favoriteNumber;
    }

    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        people.push(People(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }

}