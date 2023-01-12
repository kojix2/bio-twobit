require_relative "../reference_genome"

module Bio
  class TwoBit
    class DroEre1 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "droEre1"
        @metadata.name = "droEre1"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/droEre1/bigZips/droEre1.2bit"
        super(**kwargs)
      end
    end
  end
end
