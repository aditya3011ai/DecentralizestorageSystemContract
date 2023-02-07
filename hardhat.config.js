require("@nomiclabs/hardhat-ethers");
/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.17",

  paths: {
    artifacts: "./client/src/artifacts",
  },
  networks: {
    goerli: {
      url: "https://goerli.infura.io/v3/e59417776612406ea7f0eda000ec3c04",
      accounts: [
        "d70b68e222c83504a5e931943726b00b7847241f0ee3981e04c56a5c31e5c6b2",
      ],
    },
  },
};
