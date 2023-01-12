require_relative "../reference_genome"

module Bio
  class TwoBit
    class PanPan3 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "panPan3"
        @metadata.name = "panPan3"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/panPan3/bigZips/panPan3.2bit"
        super(**kwargs)
      end
    end
  end
end
