## Installing Foundry

###On Linux and macOS
If you use Linux or macOS.

Open your terminal and type in the following command:

```sh
curl -L https://foundry.paradigm.xyz | bash
```
This will download foundryup. Then install Foundry by running:

```sh
foundryup
```

If everything goes well, you will now have four binaries at your disposal: forge, cast, anvil, and chisel.

###On Windows
Preferable to use Windows Subsystem for Linux (WSL) as an alternative. 
WSL allows you to run Linux applications directly on Windows, which can help avoid
some common installation problems. You can follow the instructions provided by Microsoft
to install WSL on your Windows machine [WSL](https://learn.microsoft.com/en-us/windows/wsl/install)

You can manually download nightly releases [here](https://github.com/foundry-rs/foundry/releases).


For more info click [here](https://book.getfoundry.sh/getting-started/installation)

## Using Foundry Commands 
 Use the commands in root folder

* To build the project
```sh
forge build
```

* To run tests the project
```sh
forge build
```

* To deploy on testnet
```sh
forge script script/MintTickets.s.sol:DeployTestnetScript --rpc-url goerli --broadcast --verify -vvvv
```

* You should have added the variables ```GOERLI_RPC_URL= PRIVATE_KEY= ETHERSCAN_API_KEY= ```
to the .env for this next part to work. Preferably only for testnet deployments

## Using Slither for static code checks
### Installation
Slither requires Python 3.8+ and solc, the Solidity compiler.
```sh
git clone https://github.com/crytic/slither.git && cd slither
python3 setup.py install
```
* To see which version of Python 3 and solc you have installed, open a command prompt and run:
```sh
python3 --version
solc --version
```
* If you don't have python3 or solc you need to install it also python setup tools :
```sh
apt-get install solc
apt-get install python3.8
apt-get install python3-setuptools
```

### Using Slither
Run Slither:
```sh
slither .
```

### For more documentation on [slither](https://github.com/crytic/slither)