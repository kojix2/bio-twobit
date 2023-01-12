require_relative "../reference_genome"

module Bio
  class TwoBit
    class DroSec1 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "droSec1"
        @metadata.name = "droSec1"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/droSec1/bigZips/droSec1.2bit"
        super(**kwargs)
      end
    end
  end
end
