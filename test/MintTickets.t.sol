// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.16;

import "forge-std/Test.sol";
import "../src/MintTickets.sol";

contract MintTicketsTest is Test {
    MintTickets public mintTickets;

    function setUp() public {
        mintTickets = new MintTickets();
    }

    function testMintTicket() public {
        address addr1 = vm.addr(1);
        string memory ipfsUrl = "https://ipfs.io/ipfs/bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";
        uint256 mintTokenReturn = mintTickets.mintToken(addr1, ipfsUrl);
        assertEq(mintTokenReturn, 1);
        assertEq(mintTickets.balanceOf(addr1), 1);
    }
}
