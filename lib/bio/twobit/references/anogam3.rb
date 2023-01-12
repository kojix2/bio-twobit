require_relative "../reference_genome"

module Bio
  class TwoBit
    class AnoGam3 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "anoGam3"
        @metadata.name = "anoGam3"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/anoGam3/bigZips/anoGam3.2bit"
        super(**kwargs)
      end
    end
  end
end
