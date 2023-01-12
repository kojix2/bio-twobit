require_relative "../reference_genome"

module Bio
  class TwoBit
    class EquCab3 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "equCab3"
        @metadata.name = "equCab3"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/equCab3/bigZips/equCab3.2bit"
        super(**kwargs)
      end
    end
  end
end
