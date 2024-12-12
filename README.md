# AutoIT Packet Filter

This repository contains an AutoIT script that allows users to filter Wireshark packet capture files for ARP packets or retransmits.

## Features
- Prompts the user to select a pcap file.
- Allows the user to choose between filtering ARP packets or retransmits.
- Displays the filtered results in a message box.

## Prerequisites
- [AutoIt](https://www.autoitscript.com/site/autoit/downloads/)
- [Wireshark](https://www.wireshark.org/download.html) (make sure `tshark` is available in your PATH)

## Installation
1. Clone the repository:
    ```bash
    git clone https://github.com/YourUsername/AutoIT-Packet-Filter.git
    ```
2. Open the script file `FilterPackets.au3` in the AutoIt Script Editor (SciTE).

## Usage
1. Run the `FilterPackets.au3` script using AutoIt.
2. Select the pcap file to analyze.
3. Choose the filter type (ARP packets or retransmits).
4. View the filtered results in the message box.


## Authors
- **CadGoose** - *Initial work* - [CadGoose's Github](https://github.com/CadGoose)
