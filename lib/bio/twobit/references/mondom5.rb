require_relative "../reference_genome"

module Bio
  class TwoBit
    class MonDom5 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "monDom5"
        @metadata.name = "monDom5"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/monDom5/bigZips/monDom5.2bit"
        super(**kwargs)
      end
    end
  end
end
