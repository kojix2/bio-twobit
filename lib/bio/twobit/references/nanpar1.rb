require_relative "../reference_genome"

module Bio
  class TwoBit
    class NanPar1 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "nanPar1"
        @metadata.name = "nanPar1"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/nanPar1/bigZips/nanPar1.2bit"
        super(**kwargs)
      end
    end
  end
end
