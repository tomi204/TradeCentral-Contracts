// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract TradeCentral{
     address public owner;

     uint256 itemCount;

     struct Trade{
        uint256 id;
         address buyer;
         address seller;
         uint256 price;
         string name;
         string description;
         string image;
       }

     struct userData{
            address user;
            Trade[] trades;
            string email;
            string name;
            string image;
     }

     mapping(address => userData) public users;
     mapping(uint256 => Trade) public trades;

     constructor(){
         owner = msg.sender;
     }

     function createUser(string memory _email, string memory _name, string memory image)  external  {
          require(msg.sender != address(0), "Invalid address");
          require(users[msg.sender].user == msg.sender, "User already exists");
          
     }
   


}
