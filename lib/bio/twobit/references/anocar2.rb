require_relative "../reference_genome"

module Bio
  class TwoBit
    class AnoCar2 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "anoCar2"
        @metadata.name = "anoCar2"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/anoCar2/bigZips/anoCar2.2bit"
        super(**kwargs)
      end
    end
  end
end
