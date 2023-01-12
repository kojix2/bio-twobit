require_relative "../reference_genome"

module Bio
  class TwoBit
    class PapAnu4 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "papAnu4"
        @metadata.name = "papAnu4"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/papAnu4/bigZips/papAnu4.2bit"
        super(**kwargs)
      end
    end
  end
end
