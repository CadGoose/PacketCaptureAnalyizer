#include <Array.au3>
#include <MsgBoxConstants.au3>

Func GetPCAPFile()
    Local $file = FileOpenDialog("Select a pcap file", "", "PCAP Files (*.pcap;*.pcapng)|All Files (*.*)", 1)
    If @error Then
        MsgBox($MB_ICONERROR, "Error", "No file selected.")
        Exit
    EndIf
    Return $file
EndFunc

Func GetFilterChoice()
    Local $filterChoices = "1. ARP packets" & @CRLF & "2. Retransmits"
    Local $choice = InputBox("Filter Choice", "Choose the filter type:" & @CRLF & $filterChoices, "", "", 320, 120)
    If @error Then
        MsgBox($MB_ICONERROR, "Error", "No filter choice entered.")
        Exit
    EndIf
    Return $choice
EndFunc

Func FilterPackets($pcapFile, $filterChoice)
    Local $command, $result, $exitCode
    Switch $filterChoice
        Case 1
            $command = 'tshark -r "' & $pcapFile & '" -Y "arp"'
        Case 2
            $command = 'tshark -r "' & $pcapFile & '" -Y "tcp.analysis.retransmission"'
        Case Else
            MsgBox($MB_ICONERROR, "Error", "Invalid choice. Please select either '1' for ARP packets or '2' for retransmits.")
            Exit
    EndSwitch
    $result = RunWait($command, "", @SW_HIDE, $STDOUT_CHILD + $STDERR_CHILD)
    If $result <> 0 Then
        MsgBox($MB_ICONERROR, "Error", "Failed to execute tshark command. Please ensure tshark is installed and in your PATH.")
        Exit
    EndIf
    $output = StdoutRead($result)
    If @error Then
        MsgBox($MB_ICONERROR, "Error", "Failed to read the output.")
        Exit
    EndIf
    MsgBox($MB_ICONINFORMATION, "Filtered Results", $output)
EndFunc

; Main script
Local $pcapFile = GetPCAP
