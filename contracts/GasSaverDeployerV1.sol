pragma solidity >=0.5.0 <0.6.0;

import "@emilianobonassi/gas-saver/ChiGasSaver.sol";

/// @title Gas Saver Deployer - Allows to deploy a contract saving gas.
/// @author Emiliano Bonassi - <bonassi.emiliano@gmail.com>
contract GasSaverDeployerV1 is ChiGasSaver {

    // deploy and execute calldata _data on contract _code
    function deployAndExecute(bytes memory _code, bytes memory _data)
    public
    payable
    saveGas(msg.sender)
    returns (address target, bytes memory response) {
        target = _deploy(_code);

        // execute
        assembly {
            let succeeded := delegatecall(sub(gas, 5000), target, add(_data, 0x20), mload(_data), 0, 0)
            let size := returndatasize

            response := mload(0x40)
            mstore(0x40, add(response, and(add(add(size, 0x20), 0x1f), not(0x1f))))
            mstore(response, size)
            returndatacopy(add(response, 0x20), 0, size)

            switch iszero(succeeded)
            case 1 {
            // throw if delegatecall failed
                revert(add(response, 0x20), size)
            }
        }
    }

    // just deploy contract _code
    function deploy(bytes memory _code)
    public
    saveGas(msg.sender)
    returns (address target) {
        target = _deploy(_code);
    }

    function _deploy(bytes memory _code)
    internal
    returns (address target) {
        assembly {
            target := create(0, add(_code, 0x20), mload(_code))
            switch iszero(extcodesize(target))
            case 1 {
            // throw if contract failed to deploy
                revert(0, 0)
            }
        }
    }
}
