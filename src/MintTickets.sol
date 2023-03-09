// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

import "openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";
import "openzeppelin-contracts/contracts/utils/Counters.sol";
import "openzeppelin-contracts/contracts/access/Ownable.sol";

contract MintTickets is ERC721, Ownable {
    string private constant BASE_IPFS_URL = "ipfs://";

    using Strings for uint256;
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIds;

    struct TokenMetadata {
        string _tokenURI;
        string _eventName;
        string _eventDescription;
        string _ticketNumber;
    }

    mapping(uint256 => TokenMetadata) private _tokenMetadatas;

    constructor() ERC721("EvedoTickets", "EVDT") {}

    function mintToken(
        address owner,
        string calldata metadataURI,
        string calldata eventName,
        string calldata eventDescription,
        string calldata ticketNumber
    ) public onlyOwner returns (uint256) {
        _tokenIds.increment();
        uint256 id = _tokenIds.current();
        _safeMint(owner, id);
        TokenMetadata memory metadata = TokenMetadata(
            string(abi.encodePacked(BASE_IPFS_URL, metadataURI)), eventName, eventDescription, ticketNumber
        );
        _setTokenMetadata(id, metadata);

        return id;
    }

    /**
 * @dev Sets `_TokenMetadata` as the TokenMetadata of `tokenId`.
     *
     * Requirements:
     *
     * - `tokenId` must exist.
     */
    function _setTokenMetadata(uint256 tokenId, TokenMetadata memory _tokenMetadata) internal {
        _requireMinted(tokenId);
        _tokenMetadatas[tokenId] = _tokenMetadata;
    }

    /**
     * @dev Views `_tokenURI` as the tokenURI of `tokenId`.
     *
     * Requirements:
     *
     * - `tokenId` must exist.
     */
    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        _requireMinted(tokenId);

        return _tokenMetadatas[tokenId]._tokenURI;
    }

    /**
     * @dev Views `_TokenMetadata` as the TokenMetadata of `tokenId`.
     *
     * Requirements:
     *
     * - `tokenId` must exist.
     */
    function tokenMetadata(uint256 tokenId) public view returns (TokenMetadata memory) {
        _requireMinted(tokenId);

        return _tokenMetadatas[tokenId];
    }
}
