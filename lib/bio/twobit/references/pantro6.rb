require_relative "../reference_genome"

module Bio
  class TwoBit
    class PanTro6 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "panTro6"
        @metadata.name = "panTro6"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/panTro6/bigZips/panTro6.2bit"
        super(**kwargs)
      end
    end
  end
end
