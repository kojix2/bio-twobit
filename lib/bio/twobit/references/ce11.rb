require_relative "../reference_genome"

module Bio
  class TwoBit
    class Ce11 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "ce11"
        @metadata.name = "ce11"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/ce11/bigZips/ce11.2bit"
        super(**kwargs)
      end
    end
  end
end
