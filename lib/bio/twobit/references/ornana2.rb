require_relative "../reference_genome"

module Bio
  class TwoBit
    class OrnAna2 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "ornAna2"
        @metadata.name = "ornAna2"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/ornAna2/bigZips/ornAna2.2bit"
        super(**kwargs)
      end
    end
  end
end
