require_relative "../reference_genome"

module Bio
  class TwoBit
    class NasLar1 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "nasLar1"
        @metadata.name = "nasLar1"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/nasLar1/bigZips/nasLar1.2bit"
        super(**kwargs)
      end
    end
  end
end
