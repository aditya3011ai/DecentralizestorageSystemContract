const hre = require("hardhat");

const main = async () => {
  const Upload = await hre.ethers.getContractFactory("AppContract");

  const upload = await Upload.deploy();

  await upload.deployed();

  console.log("Contract deployed to:", upload.address);
};

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
