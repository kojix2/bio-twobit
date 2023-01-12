require_relative "../reference_genome"

module Bio
  class TwoBit
    class HetGla2 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "hetGla2"
        @metadata.name = "hetGla2"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/hetGla2/bigZips/hetGla2.2bit"
        super(**kwargs)
      end
    end
  end
end
