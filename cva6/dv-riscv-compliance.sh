###############################################################################
#
# Copyright 2020 Thales DIS Design Services SAS
#
# Licensed under the Solderpad Hardware Licence, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://solderpad.org/licenses/
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
###############################################################################
#
# Original Author: Jean-Roch COULON (jean-roch.coulon@invia.fr)
#
###############################################################################

# where are the tools
if ! [ -n "$RISCV" ]; then
  echo "Error: RISCV variable undefined"
  return
fi

# install the required tools
source ./cva6/install-cva6.sh
source ./cva6/install-riscv-dv.sh
source ./cva6/install-riscv-compliance.sh

if ! [ -n "$DV_TARGET" ]; then
  DV_TARGET=rv64gc
fi

if ! [ -n "$DV_SIMULATORS" ]; then
#  DV_SIMULATORS=verilator,spike
  DV_SIMULATORS=vsim,spike
fi

cd uvm/riscv-dv
python3 run.py --testlist=../../cva6/tests/testlist_riscv-compliance-$DV_TARGET.yaml --target $DV_TARGET --iss=$DV_SIMULATORS $DV_OPTS
cd ../..
