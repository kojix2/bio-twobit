require_relative "../reference_genome"

module Bio
  class TwoBit
    class GorGor6 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "gorGor6"
        @metadata.name = "gorGor6"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/gorGor6/bigZips/gorGor6.2bit"
        super(**kwargs)
      end
    end
  end
end
