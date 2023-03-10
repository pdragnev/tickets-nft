// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.16;

import "forge-std/Test.sol";
import "../src/MintTickets.sol";

contract MintTicketsTest is Test {
    string private constant BASE_IPFS_URL = "ipfs://";
    MintTickets public mintTickets;

    function setUp() public {
        mintTickets = new MintTickets();
    }

    function testMintTicket() public {
        address addr1 = vm.addr(1);
        string memory ipfsCID = "bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4";
        string memory eventName = "EventName";
        string memory eventDesc = "Event Description";
        string memory ticketNumber = "12345";
        uint256 mintTokenReturn = mintTickets.mintToken(addr1, ipfsCID, eventName, eventDesc, ticketNumber);
        assertEq(mintTokenReturn, 1);
        assertEq(mintTickets.balanceOf(addr1), 1);
        assertEq(mintTickets.tokenURI(mintTokenReturn), string(abi.encodePacked(BASE_IPFS_URL, ipfsCID)));

        Types.TokenMetadata memory tokenMetadataReturned = mintTickets.tokenMetadata(mintTokenReturn);

        assertEq(tokenMetadataReturned._tokenURI, string(abi.encodePacked(BASE_IPFS_URL, ipfsCID)));
        assertEq(tokenMetadataReturned._eventName, eventName);
        assertEq(tokenMetadataReturned._eventDescription, eventDesc);
        assertEq(tokenMetadataReturned._ticketNumber, ticketNumber);
    }
}
