require_relative "../reference_genome"

module Bio
  class TwoBit
    class RheMac10 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "rheMac10"
        @metadata.name = "rheMac10"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/rheMac10/bigZips/rheMac10.2bit"
        super(**kwargs)
      end
    end
  end
end
