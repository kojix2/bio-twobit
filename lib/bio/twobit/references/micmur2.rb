require_relative "../reference_genome"

module Bio
  class TwoBit
    class MicMur2 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "micMur2"
        @metadata.name = "micMur2"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/micMur2/bigZips/micMur2.2bit"
        super(**kwargs)
      end
    end
  end
end
