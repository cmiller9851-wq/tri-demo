#!/bin/bash
# [span_15](start_span)Tri-Installer: Zero Friction Deployment[span_15](end_span)
# Updated for CC-BY-4.0 Sovereign Compliance

echo "Initializing Tri-Demo Environment..."
mkdir -p /opt/tri-demo/contracts
mkdir -p /opt/tri-demo/scripts

# Move assets to sovereign directories
mv GLX_USD_Token.sol /opt/tri-demo/contracts/
mv CRA_Watchdog_v1.py /opt/tri-demo/scripts/

echo "Deployment complete. Assets secured in /opt/tri-demo."
