require_relative "../reference_genome"

module Bio
  class TwoBit
    class DasNov3 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "dasNov3"
        @metadata.name = "dasNov3"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/dasNov3/bigZips/dasNov3.2bit"
        super(**kwargs)
      end
    end
  end
end
