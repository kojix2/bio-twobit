require_relative "../reference_genome"

module Bio
  class TwoBit
    class OryCun2 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "oryCun2"
        @metadata.name = "oryCun2"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/oryCun2/bigZips/oryCun2.2bit"
        super(**kwargs)
      end
    end
  end
end
