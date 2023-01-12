require_relative "../reference_genome"

module Bio
  class TwoBit
    class AquChr2 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "aquChr2"
        @metadata.name = "aquChr2"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/aquChr2/bigZips/aquChr2.2bit"
        super(**kwargs)
      end
    end
  end
end
