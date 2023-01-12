require_relative "../reference_genome"

module Bio
  class TwoBit
    class Cb3 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "cb3"
        @metadata.name = "cb3"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/cb3/bigZips/cb3.2bit"
        super(**kwargs)
      end
    end
  end
end
