require_relative "../reference_genome"

module Bio
  class TwoBit
    class TarSyr2 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "tarSyr2"
        @metadata.name = "tarSyr2"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/tarSyr2/bigZips/tarSyr2.2bit"
        super(**kwargs)
      end
    end
  end
end
