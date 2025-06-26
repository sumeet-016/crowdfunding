const hre = require("hardhat");

async function main() {
  const Crowdfunding = await hre.ethers.getContractFactory("Crowdfunding");

  const goalAmount = hre.ethers.utils.parseEther("5"); // 5 ETH goal
  const crowdfunding = await Crowdfunding.deploy(goalAmount);

  await crowdfunding.deployed(); // ✅ Correct for ethers v5

  console.log(`✅ Crowdfunding deployed to: ${crowdfunding.address}`);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error("❌ Deployment failed:", error);
    process.exit(1);
  });
