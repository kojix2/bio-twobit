require_relative "../reference_genome"

module Bio
  class TwoBit
    class VicPac2 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "vicPac2"
        @metadata.name = "vicPac2"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/vicPac2/bigZips/vicPac2.2bit"
        super(**kwargs)
      end
    end
  end
end
