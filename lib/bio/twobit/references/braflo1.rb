require_relative "../reference_genome"

module Bio
  class TwoBit
    class BraFlo1 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "braFlo1"
        @metadata.name = "braFlo1"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/braFlo1/bigZips/braFlo1.2bit"
        super(**kwargs)
      end
    end
  end
end
