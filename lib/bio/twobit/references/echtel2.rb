require_relative "../reference_genome"

module Bio
  class TwoBit
    class EchTel2 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "echTel2"
        @metadata.name = "echTel2"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/echTel2/bigZips/echTel2.2bit"
        super(**kwargs)
      end
    end
  end
end
