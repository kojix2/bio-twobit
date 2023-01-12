require_relative "../reference_genome"

module Bio
  class TwoBit
    class LatCha1 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "latCha1"
        @metadata.name = "latCha1"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/latCha1/bigZips/latCha1.2bit"
        super(**kwargs)
      end
    end
  end
end
