#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd $DIR

rm -rf tmp_contracts
mv contracts tmp_contracts
mkdir -p contracts/v612
rm -rf artifacts
rm -rf cache
npx truffle-flattener tmp_contracts/v612/cBTC.sol >> contracts/v612/flattened_cBTC.sol
mkdir -p flattened_sols
function pause(){
 read -s -n 1 -p "Press any key to continue . . ."
 echo ""
}
pause
yarn run buidler remove-logs
npx buidler compile
mv contracts/v612/flattened_cBTC.sol flattened_sols
rm -rf contracts
mv tmp_contracts contracts
echo "Built cBTC.sol"