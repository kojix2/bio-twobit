require_relative "../reference_genome"

module Bio
  class TwoBit
    class TaeGut2 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "taeGut2"
        @metadata.name = "taeGut2"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/taeGut2/bigZips/taeGut2.2bit"
        super(**kwargs)
      end
    end
  end
end
