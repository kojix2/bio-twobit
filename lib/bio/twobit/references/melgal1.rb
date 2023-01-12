require_relative "../reference_genome"

module Bio
  class TwoBit
    class MelGal1 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "melGal1"
        @metadata.name = "melGal1"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/melGal1/bigZips/melGal1.2bit"
        super(**kwargs)
      end
    end
  end
end
