require_relative "../reference_genome"

module Bio
  class TwoBit
    class OviAri4 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "oviAri4"
        @metadata.name = "oviAri4"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/oviAri4/bigZips/oviAri4.2bit"
        super(**kwargs)
      end
    end
  end
end
