require_relative "../reference_genome"

module Bio
  class TwoBit
    class EboVir3 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "eboVir3"
        @metadata.name = "eboVir3"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/eboVir3/bigZips/eboVir3.2bit"
        super(**kwargs)
      end
    end
  end
end
