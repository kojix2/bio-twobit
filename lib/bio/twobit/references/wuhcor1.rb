require_relative "../reference_genome"

module Bio
  class TwoBit
    class WuhCor1 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "wuhCor1"
        @metadata.name = "wuhCor1"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/wuhCor1/bigZips/wuhCor1.2bit"
        super(**kwargs)
      end
    end
  end
end
