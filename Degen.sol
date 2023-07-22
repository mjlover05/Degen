// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract DegenToken {
    // Token properties
    string public name;
    string public symbol;
    uint8 public decimals;
    uint256 public totalSupply;

    // Balances  mapping
    mapping(address => uint256) private balances;

    // Owner address
    address private owner;

    // Transfer and Approval events
    event Transfer(address indexed from, address indexed to, uint256 value);

    // Modifier to restrict certain actions to the owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this action");
        _;
    }

    // Struct to define an item in the store
    struct Item {
        uint256 itemId;
        string name;
        uint256 price;
    }

    // Array to store the items in the store
    Item[] private items;
    uint256 private nextItemId;

    // Mapping to track redeemed items for players
    mapping(address => mapping(uint256 => bool)) private purchases;

    event ItemAdded(uint256 indexed itemId, string name, uint256 price);
    event ItemGranted(address indexed player, uint256 itemId);

    // Token constructor
    constructor(
        string memory _name,
        string memory _symbol,
        uint8 _decimals,
        uint256 _initialSupply
    ) {
        name = _name;
        symbol = _symbol;
        decimals = _decimals;
        totalSupply = _initialSupply * (10 ** uint256(decimals));
        owner = msg.sender;
        balances[msg.sender] = totalSupply;
    }

    // Function to get the balance of an account
    function balanceOf(address _account) public view returns (uint256) {
        return balances[_account];
    }

    // Function to transfer tokens from the sender to a recipient
    function transfer(
        address _recipient,
        uint256 _amount
    ) public returns (bool) {
        require(_amount <= balances[msg.sender], "Insufficient balance");

        _transfer(msg.sender, _recipient, _amount);
        return true;
    }

    // Function to mint new tokens and distribute them to an account
    function mint(address _recipient, uint256 _amount) public onlyOwner {
        require(_recipient != address(0), "Invalid recipient address");

        totalSupply += _amount;
        balances[_recipient] += _amount;
        emit Transfer(address(0), _recipient, _amount);
    }

    // Function to burn tokens
    function burn(uint256 _amount) public {
        require(_amount <= balances[msg.sender], "Insufficient balance");

        totalSupply -= _amount;
        balances[msg.sender] -= _amount;
        emit Transfer(msg.sender, address(0), _amount);
    }

    // Function to add an item to the store
    function addItem(
        string memory _name,
        uint256 _price
    ) public onlyOwner returns (uint256) {
        uint256 itemId = nextItemId;
        items.push(Item(itemId, _name, _price));
        nextItemId++;

        emit ItemAdded(itemId, _name, _price);

        return itemId;
    }

    // Function to redeem an item
    function redeem(uint256 _itemId) public {
        require(_itemId < items.length, "Invalid item ID");
        require(
            balanceOf(msg.sender) >= items[_itemId].price,
            "Insufficient balance"
        );

        totalSupply -= items[_itemId].price;
        balances[msg.sender] -= items[_itemId].price;

        // Custom redemption logic: Grant the item to the player in the game
        grantItem(msg.sender, _itemId);

        emit Transfer(msg.sender, address(0), items[_itemId].price);
    }

    // Function to check if an item has been redeemed by a player
    function isItemRedeemed(
        address _player,
        uint256 _itemId
    ) public view returns (bool) {
        return purchases[_player][_itemId];
    }

    // Function to get details of an item
    function getItem(uint256 _itemId) public view returns (Item memory) {
        return items[_itemId];
    }

    // Function to get the total number of items in the store
    function getItemsCount() public view returns (uint256) {
        return items.length;
    }

    // Internal function to transfer tokens
    function _transfer(
        address _sender,
        address _recipient,
        uint256 _amount
    ) private {
        require(_sender != address(0), "Invalid sender address");
        require(_recipient != address(0), "Invalid recipient address");

        balances[_sender] -= _amount;
        balances[_recipient] += _amount;
        emit Transfer(_sender, _recipient, _amount);
    }

    // Function to grant an item to a player
    function grantItem(address _player, uint256 _itemId) public onlyOwner {
        purchases[_player][_itemId] = true;
        emit ItemGranted(_player, _itemId);
    }
}
