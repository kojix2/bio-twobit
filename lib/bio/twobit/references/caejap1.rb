require_relative "../reference_genome"

module Bio
  class TwoBit
    class CaeJap1 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "caeJap1"
        @metadata.name = "caeJap1"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/caeJap1/bigZips/caeJap1.2bit"
        super(**kwargs)
      end
    end
  end
end
