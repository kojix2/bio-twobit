require_relative "../reference_genome"

module Bio
  class TwoBit
    class ChlSab2 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "chlSab2"
        @metadata.name = "chlSab2"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/chlSab2/bigZips/chlSab2.2bit"
        super(**kwargs)
      end
    end
  end
end
