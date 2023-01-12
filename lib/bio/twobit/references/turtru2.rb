require_relative "../reference_genome"

module Bio
  class TwoBit
    class TurTru2 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "turTru2"
        @metadata.name = "turTru2"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/turTru2/bigZips/turTru2.2bit"
        super(**kwargs)
      end
    end
  end
end
