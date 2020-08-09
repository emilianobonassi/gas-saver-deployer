<h1 align=center><code>Gas Saver Deployer</code></h1>

A collection of smart contracts to save gas on Ethereum to deploy other contracts
leveraging [CHI](https://medium.com/@1inch.exchange/everything-you-wanted-to-know-about-chi-gastoken-a1ba0ea55bf3)
tokens.

Took inspiration (and part of the code) from the beautiful [ds-proxy](https://github.com/dapphub/ds-proxy) by DappHub

### Contract addresses

GasSaverDeployerV1 [0x09186cd35eb543a7644420eb097888700f710501](https://etherscan.io/address/0x09186cd35eb543a7644420eb097888700f710501)

### How To Use

You can deploy a smart contract and optionally execute atomically a function (e.g. swap owner).

Just call `deploy(bytes memory _code)` and `deployAndExecute(bytes memory _code, bytes memory _data)`.

The module export abi and mainnet address. Below an example.

```
const gasSaverDeployer = require('@emilianobonassi/gas-saver-deployer');

...
// already declarated ethers, yourSigner and yourContractByteCode

const gasSaverDeployerInstance = new ethers.Contract(gasSaverDeployer.address, gasSaverDeployer.abi, yourSigner);

await gasSaverDeployerInstance.deploy(yourContractByteCode);

```




