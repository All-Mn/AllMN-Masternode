# AllMN Masternode install (Ubuntu 16.04)
***

## Installation
```
wget -q https://raw.githubusercontent.com/All-Mn/AllMN-Masternode/master/install.sh
bash install.sh
```
***

## Desktop wallet setup

After the MN is up and running, you need to configure the desktop wallet accordingly. Here are the steps:  
1. Open the AllMN Desktop Wallet.  
2. Go to RECEIVE and create a New Address: **MN1**  
3. Send **2000** ALMN to **MN1**. You need to send all 2000 coins in one single transaction.
4. Wait for 15 confirmations.  
5. Go to **Help -> "Debug Window - Console"**  
6. Type the following command: **masternode outputs**
7. Go to  **Tools -> "Open Masternode Configuration File"**
8. Add the following entry:
```
Alias Address Privkey TxHash Output_index
```
* Alias: **MN1**
* Address: **VPS_IP:PORT**
* Privkey: **Masternode Private Key**
* TxHash: **First value from Step 6**
* Output index:  **Second value from Step 6**
9. Save and close the file.
10. Go to **Masternode Tab**. If you tab is not shown, please enable it from: **Settings - Options - Wallet - Show Masternodes Tab**
11. Click **Update status** to see your node. If it is not shown, close the wallet and start it again. Make sure the wallet is un
12. Select your MN and click **Start Alias** to start it.
13. Alternatively, open **Debug Console** and type:
```
masternode start-alias MN1
```
14. Login to your VPS and check your masternode status by running the following command:.
```
allmn-cli masternode status
```
***

## Usage:
```
allmn-cli mnsync status
allmn-cli masternode status  
allmn-cli getinfo
```
Also, if you AllMN to check/start/stop **AllMN**, run one of the following commands as **root**:

```
systemctl status allmn.service #To check if AllMN service is running  
systemctl start allmn.service #To start AllMN service  
systemctl stop allmn.service #To stop AllMN service  
systemctl is-enabled allmn.service #To check if AllMN service is enabled on boot  
```  
***
