//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7.0 <0.9.0;

contract transferUponDeath
{
    address owner = 0x75a9EAfA69CDFaB59EBe677fD5db85D790566758;
    address newOwner = 0xb7B14d15953397A085a4cBAA7754d53B67893025;

    //checks whether the original owner is calling or someone else
    modifier isOwner()
    {
        require(msg.sender == owner);
        _;
    }


    //function to determine the address of the owner who will inherit the balance after original owner's death
    function setNewOwner(address _newOwner) external isOwner
    {
        newOwner = _newOwner; 
    }

    uint lastBlockAccessed;

     //stores the value of the last block accessed by the owner
    function callBlock() external isOwner
    {
        lastBlockAccessed = block.number;
    }

    //checks whether the owner is dead or alive based on the condition given
    function checkDeadOrAlive() public
    {
        if(lastBlockAccessed<block.number-10)
        {
            isDead();
        }
    }

    //this is implemented if the owner is dead, it transfers all the balance of the original owner to the new owner
    function isDead() internal
    {
        uint ownerBalance = owner.balance;
        payable(newOwner).transfer(ownerBalance);
    }

    receive() external payable {}
}

/*
//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7.0 <0.9.0;

contract transferUponDeath
{
    address owner = 0x75a9EAfA69CDFaB59EBe677fD5db85D790566758;
    address newOwner = 0xb7B14d15953397A085a4cBAA7754d53B67893025;


    //checks whether the original owner is calling or someone else
    modifier isOwner() 
    {
        require(msg.sender == owner);
        _;
    }


    //function to determine the address of the owner who will inherit the balance after original owner's death
    function setNewOwner(address _newOwner) external isOwner
    {
        newOwner = _newOwner; 
    }


    //stores the value of the last block accessed by the owner
    uint lastBlockAccessed;
    function callBlock() external isOwner
    {
        lastBlockAccessed = block.number;
    }


    //checks whether the owner is dead or alive based on the condition given
    function checkDeadOrAlive() public
    {
        if(lastBlockAccessed<block.number-10)
        {
            isDead();
        }
    }


    //this is called if the owner is dead. It transfers all the balance of the original owner to the new owner
    function isDead() internal
    {
        uint ownerBalance = owner.balance;
        payable(newOwner).transfer(ownerBalance);
    }
}
*/