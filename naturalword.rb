##
# This module requires Metasploit: https://metasploit.com/download
# Current source: https://github.com/rapid7/metasploit-framework
##


class MetasploitModule < Msf::Encoder

## TODO: Limit file format to Framework Transform Formats

  def initialize
    super(
      'Name'             => 'Natural Word Encoder',
      'Description'      => %q{
        This encoder use a translation table of 256 natural language words of 4 character size. Each byte value of the payload will be translated into the corresponding word.  
      },
      'Author'           => 'Klaus Mueller',
      'License'          => MSF_LICENSE,
      'Arch'             => ARCH_ALL,
      'EncoderType'      => Msf::Encoder::Type::Raw)
  end
  
  def encode_block(state, block)
	 translation_table = [
	 "DILL","CASH","EMSE","FACT","DEWA","BERG","FESE","ÖFFI","GLAU","BEYS","ALBE","EWIG","GRÄT","BOHR","ÄSSE","DUCK",
	 "GAUR","DOME","BLUT","DEKO","DACH","ÜBEL","FURZ","CALF","FRÜG","ANNO","EMIR","BUGS","DING","DALK","DERB","FEGT",
	 "AREN","ÖDEM","GÄUS","AALE","DIMM","DELI","GETA","ALGE","BOLZ","BÜXE","DITS","ADRE","EKLE","AAST","BAHT","BÄRS",
	 "ESST","ERBT","FEIN","ÜZES","CLOG","BOYS","EMDE","DOJO","FLUR","BÜRD","BOBS","GIEN","EIDE","BAUS","DARG","DEEZ",
	 "BÖGT","ALSO","AALT","ÖLES","FLUG","DEOS","BOHN","EGGE","ÖLST","GAZI","BÄRE","COCA","FAMA","ÖSEN","AARE","FIRN",
	 "FLOH","ASAR","AHMT","AAKS","CUPS","AURA","DÄNE","BEIM","FANS","GALA","GILT","GATE","ARGE","FINK","FACK","ELUL",
	 "DURA","CARS","GINS","DIPP","CORD","ALAN","BRIE","ARTE","BOAS","BASH","BURG","GEIE","DOLM","DOTZ","BOIS","GIEP",
	 "GRAN","BIKT","ERDE","FLAU","ACHS","FALT","DIES","BIER","GEHR","GÖRS","BUHL","FAXT","BIDA","FLÖZ","FENZ","ALFA",
	 "EINT","ENGT","GEIG","AINU","ENKE","BEUT","CURE","FAXE","AHLE","BLAK","ALLA","AJAX","DAUN","ARME","BROM","GLÜH",
	 "DÜST","CAPE","GRÄM","DATE","AZOL","DEVA","BÄBÄ","GEIT","AUFN","BARR","AAME","DUNE","ALIA","APPS","DUPE","FAKE",
	 "BEST","FÖRE","DION","ETAT","BEIE","DÜNG","DODO","BLAS","FRÄS","ANOA","EULE","FASE","DOLS","BOHL","DUAL","FIPS",
	 "GIBT","BITS","EMMY","EDLE","DENS","ÖHMS","BAFF","GERM","ARZT","CITY","GRAY","ÖDER","BEÖL","AULS","BANE","EBBT",
	 "AMID","EXIL","BELS","GAUE","ALOI","DIEB","CLUB","AXEL","GEER","BADE","FEIL","EIRE","ESTE","BASS","AHAR","AKNE",
	 "BABY","EISE","DIOL","ACTS","ANIL","GAUL","BÖTE","EFEU","ACTA","FELG","GAUZ","AHNS","BRAM","FUZO","ÄTZT","BIOM",
	 "GAGT","CLIP","BIGA","GÜTE","BRÜH","COLT","BÜRO","ALLE","BUHS","BUDE","BELT","DONG","DORT","ESSE","DENK","ELKO",
	 "EREN","FECK","ANOM","EIBE","BANI","DOSE","GEHE","AHMS","ANKT","FORA","FAHL","DIEL","AMYL","BÜSI","DICK","GAFF"]

    encoded = ''

	 block.unpack('C*').each do |chr|
      i = chr.ord
      word = translation_table[i]
      encoded << word
    end
    return encoded
  end
end


