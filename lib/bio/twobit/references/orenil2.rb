require_relative "../reference_genome"

module Bio
  class TwoBit
    class OreNil2 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "oreNil2"
        @metadata.name = "oreNil2"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/oreNil2/bigZips/oreNil2.2bit"
        super(**kwargs)
      end
    end
  end
end
