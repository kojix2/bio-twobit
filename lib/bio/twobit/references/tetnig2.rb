require_relative "../reference_genome"

module Bio
  class TwoBit
    class TetNig2 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "tetNig2"
        @metadata.name = "tetNig2"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/tetNig2/bigZips/tetNig2.2bit"
        super(**kwargs)
      end
    end
  end
end
