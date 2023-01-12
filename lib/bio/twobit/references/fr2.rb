require_relative "../reference_genome"

module Bio
  class TwoBit
    class Fr2 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "fr2"
        @metadata.name = "fr2"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/fr2/bigZips/fr2.2bit"
        super(**kwargs)
      end
    end
  end
end
