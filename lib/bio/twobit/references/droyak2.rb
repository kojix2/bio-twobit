require_relative "../reference_genome"

module Bio
  class TwoBit
    class DroYak2 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "droYak2"
        @metadata.name = "droYak2"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/droYak2/bigZips/droYak2.2bit"
        super(**kwargs)
      end
    end
  end
end
