require_relative "../reference_genome"

module Bio
  class TwoBit
    class AllMis1 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "allMis1"
        @metadata.name = "allMis1"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/allMis1/bigZips/allMis1.2bit"
        super(**kwargs)
      end
    end
  end
end
