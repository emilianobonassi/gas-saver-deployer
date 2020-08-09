const abi = [
    {
        "constant": false,
        "inputs": [
            {
                "internalType": "bytes",
                "name": "_code",
                "type": "bytes"
            },
            {
                "internalType": "bytes",
                "name": "_data",
                "type": "bytes"
            }
        ],
        "name": "deployAndExecute",
        "outputs": [
            {
                "internalType": "address",
                "name": "target",
                "type": "address"
            },
            {
                "internalType": "bytes",
                "name": "response",
                "type": "bytes"
            }
        ],
        "payable": true,
        "stateMutability": "payable",
        "type": "function"
    },
    {
        "constant": false,
        "inputs": [
            {
                "internalType": "bytes",
                "name": "_code",
                "type": "bytes"
            }
        ],
        "name": "deploy",
        "outputs": [
            {
                "internalType": "address",
                "name": "target",
                "type": "address"
            }
        ],
        "payable": false,
        "stateMutability": "nonpayable",
        "type": "function"
    }
];

const address = '0x09186cD35EB543A7644420EB097888700F710501';

module.exports = {
    abi,
    address,
}
