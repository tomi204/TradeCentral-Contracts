// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract TradeCentral {

     //@dev global variables
    address public owner;

    uint256 userCount;
    uint256 tradeCount;

//@dev structs
    struct Trade {
        uint256 id;
        address buyer;
        address seller;
        uint256 price;
        string name;
        string description;
        string image;
    }

    struct userData {
        uint256 id;
        address user;
        Trade[] trades;
        string email;
        string name;
        string image;
    }

    mapping(uint256 => userData) public users;
    mapping(uint256 => Trade) public trades;

//@dev constructor
    constructor() {
        owner = msg.sender;
    }

//@dev function  create one userr
    function createUser(
        string memory _email,
        string memory _name,
        string memory image
    ) external {
        require(msg.sender != address(0), "Invalid address");
        require(bytes(_email).length > 0, "Invalid email");
        require(bytes(_name).length > 0, "Invalid name");
        require(bytes(image).length > 0, "Invalid image");
        userCount++;
        users[userCount] = userData(
            userCount,
            msg.sender,
            new Trade[](0),
            _email,
            _name,
            image
        );
    }

    //@dev function create one trade

    function createTrade(
        uint256 _price,
        string memory _name,
        string memory _description,
        string memory _image
    ) external {
        require(msg.sender != address(0), "Invalid address");
        require(_price > 0, "Invalid price");
        require(bytes(_name).length > 0, "Invalid name");
        require(bytes(_description).length > 0, "Invalid description");
        require(bytes(_image).length > 0, "Invalid image");
        tradeCount++;
        trades[tradeCount] = Trade(
            tradeCount,
            msg.sender,
            address(0),
            _price,
            _name,
            _description,
            _image
        );
        users[userCount].trades.push(trades[tradeCount]);
    }

    //@dev function for update profile user

     function updateProfile(
          string memory _email,
          string memory _name,
          string memory _image
     ) external {
          require(msg.sender != address(0), "Invalid address");
          require(bytes(_email).length > 0, "Invalid email");
          require(msg.sender == users[userCount].user, "Invalid user");
          require(bytes(_name).length > 0, "Invalid name");
          require(bytes(_image).length > 0, "Invalid image");
          users[userCount].email = _email;
          users[userCount].name = _name;
          users[userCount].image = _image;
     }
}
