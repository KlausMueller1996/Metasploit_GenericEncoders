##
# This module requires Metasploit: https://metasploit.com/download
# Current source: https://github.com/rapid7/metasploit-framework
##


class MetasploitModule < Msf::Encoder

  def initialize
    super(
      'Name'             => 'Shuffle Encoder',
      'Description'      => %q{
        This encoder Shuffles the uneven bytes in the payload to avoid regex pattern matching algorithms. Byte 1 is swapped with byte 3, byte 5 is swapped with byte 7, etc 
      },
      'Author'           => 'Klaus Mueller',
      'License'          => MSF_LICENSE,
      'Arch'             => ARCH_ALL,
      'EncoderType'      => Msf::Encoder::Type::Raw)
  end

  def encode_block(state, block)

    encoded = ''   
    encoder_len = 0

    my_array = block.unpack('C*')

    # as the encoder needs blocks of 4 bytes we need to make sure we stop at the proper position 
    len = my_array.length() 
    
    # number of bytes that need to be encoded 
    encoder_len = len - len % 4

    my_array.each_with_index do |val,index|
    
      ## shuffle bytes if we have a complete block of 4 left
      if index <= encoder_len
        
        # if are at position 1 we take byte number 3
		  if index % 4 == 1
          encoded << my_array[index+2].chr

        # if are at position 3 we take byte number 1
        elsif index % 4 == 3
          encoded << my_array[index-2].chr

        # the even bytes remain unchanged
        else
          encoded << val.chr
        end

      # append the last bytes as they are 
      else
        encoded << val.chr
      end
      
    end    
    return encoded
  end
end
