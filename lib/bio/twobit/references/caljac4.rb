require_relative "../reference_genome"

module Bio
  class TwoBit
    class CalJac4 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "calJac4"
        @metadata.name = "calJac4"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/calJac4/bigZips/calJac4.2bit"
        super(**kwargs)
      end
    end
  end
end
