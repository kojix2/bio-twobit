require_relative "../reference_genome"

module Bio
  class TwoBit
    class OchPri3 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "ochPri3"
        @metadata.name = "ochPri3"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/ochPri3/bigZips/ochPri3.2bit"
        super(**kwargs)
      end
    end
  end
end
