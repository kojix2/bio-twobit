require_relative "../reference_genome"

module Bio
  class TwoBit
    class NeoSch1 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "neoSch1"
        @metadata.name = "neoSch1"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/neoSch1/bigZips/neoSch1.2bit"
        super(**kwargs)
      end
    end
  end
end
