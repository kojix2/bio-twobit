require_relative "../reference_genome"

module Bio
  class TwoBit
    class SpeTri2 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "speTri2"
        @metadata.name = "speTri2"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/speTri2/bigZips/speTri2.2bit"
        super(**kwargs)
      end
    end
  end
end
