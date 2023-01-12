require_relative "../reference_genome"

module Bio
  class TwoBit
    class BosTau7 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "bosTau7"
        @metadata.name = "bosTau7"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/bosTau7/bigZips/bosTau7.2bit"
        super(**kwargs)
      end
    end
  end
end
