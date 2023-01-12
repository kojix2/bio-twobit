require_relative "../reference_genome"

module Bio
  class TwoBit
    class PteVam1 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "pteVam1"
        @metadata.name = "pteVam1"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/pteVam1/bigZips/pteVam1.2bit"
        super(**kwargs)
      end
    end
  end
end
