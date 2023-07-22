const { anyValue } = require("@nomicfoundation/hardhat-chai-matchers/withArgs");
const { ethers } = require("hardhat");
const { expect } = require("chai");

describe("DegenToken", function () {
  let DegenToken;
  let token;
  let owner;
  let recipient;
  let initialSupply;

  beforeEach(async () => {
    [owner, recipient] = await ethers.getSigners();

    DegenToken = await ethers.getContractFactory("DegenToken");
    token = await DegenToken.deploy("Degen Gaming Token", "DEGEN", 18, 1000000);
    await token.deployed();
  });

  it("Should have correct token properties", async () => {
    expect(await token.name()).to.equal("Degen Gaming Token");
    expect(await token.symbol()).to.equal("DEGEN");
    expect(await token.decimals()).to.equal(18);
    expect(await token.totalSupply()).to.equal(
      BigInt("1000000") * BigInt(10 ** 18)
    );
    expect(await token.balanceOf(owner.address)).to.equal(
      BigInt("1000000") * BigInt(10 ** 18)
    );
  });

  it("Should transfer tokens correctly", async () => {
    await token.transfer(recipient.address, 100);

    expect(await token.balanceOf(owner.address)).to.equal(
      BigInt("1000000") * BigInt(10 ** 18) - BigInt(100)
    );
    expect(await token.balanceOf(recipient.address)).to.equal(100);
  });

  it("Should mint and burn tokens correctly", async () => {
    await token.mint(owner.address, 500);
    expect(await token.balanceOf(owner.address)).to.equal(
      BigInt("1000000") * BigInt(10 ** 18) + BigInt(500)
    );

    await token.burn(200);
    expect(await token.balanceOf(owner.address)).to.equal(
      BigInt("1000000") * BigInt(10 ** 18) + BigInt(500) - BigInt(200)
    );
  });

  it("Should add an item and redeem it correctly", async () => {
    const newItemName = "Item 1";

    const addItemTx = await token.addItem(newItemName, 100);
    const addItemReceipt = await addItemTx.wait();
    const itemId = addItemReceipt.events[0].args.itemId.toNumber();

    const item = await token.getItem(itemId);
    expect(item.itemId).to.equal(itemId);
    expect(item.name).to.equal(newItemName);
    expect(item.price).to.equal(100);

    await token.transfer(owner.address, 100);
    await token.redeem(itemId);

    expect(await token.isItemRedeemed(owner.address, itemId)).to.be.true;
    expect(await token.balanceOf(owner.address)).to.equal(
      BigInt("1000000") * BigInt(10 ** 18) - BigInt(100)
    );
  });
});