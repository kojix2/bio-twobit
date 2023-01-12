require_relative "../reference_genome"

module Bio
  class TwoBit
    class XenTro10 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "xenTro10"
        @metadata.name = "xenTro10"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/xenTro10/bigZips/xenTro10.2bit"
        super(**kwargs)
      end
    end
  end
end
