require_relative "../reference_genome"

module Bio
  class TwoBit
    class EriEur2 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "eriEur2"
        @metadata.name = "eriEur2"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/eriEur2/bigZips/eriEur2.2bit"
        super(**kwargs)
      end
    end
  end
end
