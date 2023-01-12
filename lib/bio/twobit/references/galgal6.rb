require_relative "../reference_genome"

module Bio
  class TwoBit
    class GalGal6 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "galGal6"
        @metadata.name = "galGal6"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/galGal6/bigZips/galGal6.2bit"
        super(**kwargs)
      end
    end
  end
end
