pragma solidity  >=0.4.22 <0.7.0;
/**
 * @title Coop
 * @dev Modelling a cooperative instance
 */
 
 contract Coop{
     
     address payable member;
     address[] memAddresses;
     uint remainingBalance;
     uint rwfValue;
     //uint random_number = uint(blockhash(block.number-1))%10 + 1;
     
     mapping(address => uint) public balances;
     event Sent(address from, address to, uint amount);
     
     constructor (address payable _member) public {
         member = _member;
     }
     
     function getAddress() external view returns(address payable) {
        return member;
    }
    function setAddress(address payable _member) public {
        member = _member;
    }
     
     function pay(uint _amount) public payable onlyOwner {
         require(_amount <= balances[msg.sender], "Insufficient balance.");
         balances[msg.sender] -= _amount;
         balances[member] += _amount;
         member.transfer(msg.value);
         emit Sent(msg.sender, member, _amount);
     }
     
     function random() private view returns (uint8) {
       return uint8(uint256(keccak256(abi.encodePacked(block.timestamp, block.difficulty)))%251);
    }
     
    modifier onlyOwner(){
        require(msg.sender == member);
     _;    
    }
       

 }
