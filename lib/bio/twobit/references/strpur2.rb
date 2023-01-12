require_relative "../reference_genome"

module Bio
  class TwoBit
    class StrPur2 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "strPur2"
        @metadata.name = "strPur2"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/strPur2/bigZips/strPur2.2bit"
        super(**kwargs)
      end
    end
  end
end
