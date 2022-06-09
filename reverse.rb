##
# This module requires Metasploit: https://metasploit.com/download
# Current source: https://github.com/rapid7/metasploit-framework
##


class MetasploitModule < Msf::Encoder

## TODO: Limit file format to Framework Transform Formats

  def initialize
    super(
      'Name'             => 'Reverse Encoder',
      'Description'      => %q{
        This encoder reverses the payload. Do not provide a decoder_block_size as reversing needs to be done on complete payload. Does only work with non executable formats as payload needs to be reverted before execution. 
      },
      'Author'           => 'Klaus Mueller',
      'License'          => MSF_LICENSE,
      'Arch'             => ARCH_ALL,
      'EncoderType'      => Msf::Encoder::Type::Raw)
  end

  #
  # Simply return the inverted and reversed buf.
  #
  def encode_block(state, buf)
    encoded =''    
    
    buf = buf.reverse()
    buf.unpack('C*').each do |ch|
      encoded << (255-ch).chr
    end   
    return encoded
  end
end
