require_relative "../reference_genome"

module Bio
  class TwoBit
    class LoxAfr3 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "loxAfr3"
        @metadata.name = "loxAfr3"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/loxAfr3/bigZips/loxAfr3.2bit"
        super(**kwargs)
      end
    end
  end
end
