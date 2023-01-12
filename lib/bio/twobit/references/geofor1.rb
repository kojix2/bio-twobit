require_relative "../reference_genome"

module Bio
  class TwoBit
    class GeoFor1 < ReferenceGenome
      def initialize(**kwargs)
        @metadata      = Metadata.new
        @metadata.id   = "geoFor1"
        @metadata.name = "geoFor1"
        @metadata.url  = "https://hgdownload.soe.ucsc.edu/downloads.html"
        @data_url      = "https://hgdownload.soe.ucsc.edu/goldenPath/geoFor1/bigZips/geoFor1.2bit"
        super(**kwargs)
      end
    end
  end
end
