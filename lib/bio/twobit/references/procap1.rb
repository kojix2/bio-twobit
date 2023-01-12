require_relative "../reference_genome"

module Bio
  class TwoBit
    class ProCap1 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "proCap1"
        @metadata.name = "proCap1"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/proCap1/bigZips/proCap1.2bit"
        super(**kwargs)
      end
    end
  end
end
